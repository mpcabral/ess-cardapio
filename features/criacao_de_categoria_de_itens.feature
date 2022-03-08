Feature: Criação de categoria de itens
	As a administrador de um restaurante
	I want to categorizar os pratos do cardápio
	So that o sistema deve permitir a criação, edição e remoção de categorias
	And anexação dos pratos a categorias

Scenario: adicionando nova categoria
	Given Eu estou na página do “restaurante do carlito” logado como administrador do restaurante
	And Existe o prato “lagosta com fritas” no “restaurante do carlito”
	And Existe o prato “moqueca de peixe” no “restaurante do carlito”
	And Não existe uma categoria chamada “frutos do mar”
	When Eu adiciono uma novo categoria chamada “frutos do mar”
	And Adiciono o prato “lagosta com fritas” a essa categoria criada
	Then Eu posso visualizar a categoria “frutos do mar” com o prato “lagosta com fritas”

Scenario: adicionando prato a uma categoria
	Given Eu estou na página do “restaurante do carlito” logado como administrador do restaurante
	And Existe o prato “lagosta com fritas” no “restaurante do carlito”
	And Existe o prato “moqueca de peixe” no “restaurante do carlito”
	And Existe uma categoria chamada “frutos do mar” com o prato “lagosta com fritas”
	When Eu adiciono o prato “moqueca de peixe” a categoria “frutos do mar”
	Then Eu posso visualizar a categoria “moqueca de peixe” com o prato “lagosta com fritas”
	And O prato “lagosta com fritas” ainda faz parte da categoria “frutos do mar”

Scenario: deletando uma categoria
	Given Eu estou na página do “restaurante do carlito” logado como administrador do restaurante
	And Existe o prato “lagosta com fritas” no “restaurante do carlito”
	And Existe o prato “moqueca de peixe” no “restaurante do carlito”
	And Existe uma categoria “frutos do mar” com o prato “lagosta com fritas”
	And Existe uma categoria “todos” com o prato “lagosta com fritas” e “moqueca de peixe”
	When Eu removo a categoria “frutos do mar”
	Then Eu posso visualizar a categoria “todos” com o prato “lagosta com fritas” e com o prato “moqueca de peixe”
	And A categoria “frutos do mar” não existe mais

Scenario: removendo prato de uma categoria
	Given Eu estou na página do “restaurante do carlito” logado como administrador do restaurante
	And Existe o prato “lagosta com fritas” no “restaurante do carlito”
	And Existe o prato “moqueca de peixe” no “restaurante do carlito”
	And Existe uma categoria “frutos do mar” com o prato “lagosta com fritas” e “moqueca de peixe”
	And Existe uma categoria “todos” com o prato “lagosta com fritas” e “moqueca de peixe”
	When Eu removo o prato “moqueca de peixe” da categoria “frutos do mar”
	Then Eu posso visualizar a categoria “todos” com o prato “lagosta com fritas” e com o prato “moqueca de peixe”
	And A categoria “frutos do mar” tem apenas o prato “lagosta com fritas”

Scenario: removendo prato de uma categoria
	Given Eu estou na página do “restaurante do carlito” logado como administrador do restaurante
	And Existe o prato “lagosta com fritas” no “restaurante do carlito”
	And Existe o prato “moqueca de peixe” no “restaurante do carlito”
	And Existe uma categoria “frutos do mar” com o prato “lagosta com fritas” e “moqueca de peixe”
	And Existe uma categoria “todos” com o prato “lagosta com fritas” e “moqueca de peixe”
	When Eu removo o prato “moqueca de peixe” da categoria “frutos do mar”
	Then Eu posso visualizar a categoria “todos” com o prato “lagosta com fritas” e com o prato “moqueca de peixe”
	And A Categoria “frutos do mar” tem apenas o prato “lagosta com fritas”

Scenario: falha ao adicionar categoria já existente
	Given Eu estou na página do “restaurante do carlito” logado como administrador do restaurante
	And Existe uma categoria chamada “frutos do mar”
	When Eu tento adicionar uma novo categoria chamada “frutos do mar”
	Then Eu posso visualizar uma falha que informa que já existe uma categoria com este nome

Scenario: falha ao tentar remover prato pertencente a uma única categoria
	Given Eu estou na página do “restaurante do carlito” logado como administrador do restaurante
	And Existe o prato “lagosta com fritas” no “restaurante do carlito”
	And Existe o prato “moqueca de peixe” no “restaurante do carlito”
	And Existe uma categoria “frutos do mar” com o prato “lagosta com fritas” e “moqueca de peixe”
	And Existe uma categoria “todos” sem nenhum prato
	When Eu tento remover o prato “moqueca de peixe” da categoria “frutos do mar”
	Then Eu posso visualizar uma falha que informa que o prato não pode ficar sem nenhuma categoria
	And Existe uma opção para remover adicionando a categoria "todos"

Scenario: falha ao tentar remover prato pertencente a uma única categoria 2
        Given Eu estou na página do “restaurante do carlito” logado como administrador do restaurante
        And Existe o prato “lagosta com fritas” no “restaurante do carlito”
        And Existe o prato “moqueca de peixe” no “restaurante do carlito”
        And Existe uma categoria “frutos do mar” com o prato “lagosta com fritas” e “moqueca de peixe”
        And Existe uma categoria “todos” sem nenhum prato
        When Eu tento remover o prato “moqueca de peixe” da categoria “frutos do mar”
	Then Eu posso visualizar uma falha que informa que o prato não pode ficar sem nenhuma categoria

Scenario: falha ao tentar remover prato pertencente a uma única categoria 3
        Given Eu estou na página do “restaurante do carlito” logado como administrador do restaurante
        And Existe o prato “lagosta com fritas” no “restaurante do carlito”
        And Existe o prato “moqueca de peixe” no “restaurante do carlito”
        And Existe uma categoria “frutos do mar” com o prato “lagosta com fritas” e “moqueca de peixe”
        And Existe uma categoria “todos” sem nenhum prato
        When Eu tento remover o prato “moqueca de peixe” da categoria “frutos do mar”
	Then Eu posso visualizar uma falha que informa que o prato não pode ficar sem nenhuma categoria
	Then A tela é encerrada
