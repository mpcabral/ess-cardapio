Feature: Cadastrar itens no cardápio
    As a gerente
    I want to registrar itens no cardápio
    So that eu possa adicionar novos itens ao meu cardápio

    Scenario: Cadastrar item
        Given a tela "Cardapio"
        And um botão chamado "Novo Item" na mesma tela
        When eu clicar no botão "Novo Item"
        Then um popup "Cadastrar Item" no formato de formulário, com os respectivos campos, a serem preenchidos (a saber, nome, preço, descrição e foto), do item, aparecerá

    Scenario: Confirmar cadastro - GUI
        Given o popup "Cadastrar Item"
        When eu preencher todos os campos
        And clicar no botão "Confirmar"
        Then o snackbar (popup menor e mais simples) "Feedback", com uma mensagem de confirmação, será exibida, e o popup "Cadastrar Item" será automaticamente fechado
        When eu clicar no botão "Ok", ou alguns segundos se passarem
        Then o popup "Feedback" se fechará

    Scenario: Mostrar snackbar "Feedback"
        Given a tela "Cardapio"
        When o sistema solicitar uma mensagem de confirmação
        Then o snackbar "Feedback", com uma mensagem de confirmação, será exibida
        And o snackbar desaparecerá em alguns segundos, ou após clicar no botão "Ok" no snackbar

    Scenario: Confirmar cadastro - Serviço
        Given o sistema tem seus itens armazenados
        When o sistema receber uma solicitação de cadastrar novo item
        And os campos estiverem devidamente preenchidos
        Then uma resposta de confirmação será enviada ao cliente
        And o sistema adicionará o novo item no seu armazenamento

    Scenario: Cancelar cadastro (sair da tela)
        Given o popup "Cadastrar Item"
        When eu clicar no botão "Fechar"
        Then o popup "Cadastrar Item" será fechado, e todos os campos preenchidos serão descartados
         
    Scenario: Negar cadastro - GUI
        Given o popup "Cadastrar Item"
        When eu não preencher pelo menos um campo
        And clicar no botão "Confirmar"
        Then o snackbar "Feedback", com uma mensagem de recusa, será exibida, informando o motivo pelo qual o item não pôde ser adicionado

    Scenario: Negar cadastro por preenchimento indevido - Serviço  
        Given o sistema tem seus itens armazenados
        When o sistema receber uma solicitação de cadastrar novo item
        And os campos não estiverem devidamente preenchidos
        Then uma resposta de negação será enviada ao cliente
        And o sistema tem seus itens armazenados

    Scenario: Negar cadastro por já existir um - Serviço  
        Given o sistema tem seus itens armazenados
        When o sistema receber uma solicitação de cadastrar novo item
        And já existir um item com o mesmo nome
        Then uma resposta de negação será enviada ao cliente
        And o sistema tem seus itens armazenados
<<<<<<< HEAD

=======
    
>>>>>>> desenvolvimento
    Scenario: Negar cadastro por exceder o limite de itens
        Given o sistema tem seus itens armazenados
        When o sistema receber uma solicitação de cadastrar novo item
        And o limite de itens cadastrados já foi atingido
        Then uma resposta de negação será enviada ao cliente
<<<<<<< HEAD
        And o sistema tem seus itens armazenados
        And linha extra
=======
        And o sistema tem seus itens armazenados
>>>>>>> desenvolvimento
