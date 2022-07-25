# Área para definir as configurações do arquivo
* Settings *
Documentation       Arquivo para Test Cases no Endpoint /carrinhos
Resource            ../keywords/carrinhos_keywords.robot
Suite Setup         Criar Sessao

#Área para escrever os casos que serão testados
* Test Cases *

# ----------------------- GET -----------------------
Cenário: GET Todos os Carrinhos 200
    [tags]      GET200.1
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenário: GET Carrinho Específico 200
    [tags]      GET200.2
    GET Endpoint /carrinhos id "/qbMqntef4iTOwWfg"
    Validar Status Code "200"
    Validar _id: "qbMqntef4iTOwWfg"

Cenário: GET Carrinho Inexistente 400
    [tags]      GET400
    GET Endpoint /carrinhos id "Inexistente"
    Validar Status Code "400"
    Validar message: "Carrinho não encontrado"


# ----------------------- POST -----------------------
Cenário: POST Cadastrar Carrinho 201
    [tags]      POST201
    Fazer Login e Armazenar Token
    Pega Carrinho Estatico      carrinho1
    POST Endpoint /carrinhos
    Validar Status Code "201"
    Validar message: "Cadastro realizado com sucesso"
    DELETE Endpoint "/carrinhos/cancelar-compra"
    Validar Status Code "200"
    Validar message: "Registro excluído com sucesso. Estoque dos produtos reabastecido"

Cenário: POST Cadastrar 2 Carrinhos Para o Mesmo Usuário 400
    [tags]      POST400.1
    Fazer Login e Armazenar Token
    Pega Carrinho Estatico      carrinho1
    POST Endpoint /carrinhos
    Validar Status Code "201"
    Pega Carrinho Estatico      carrinho2
    POST Outro Carrinho para Mesmo Usuario
    Validar Status Code "400"
    Validar message: "Não é permitido ter mais de 1 carrinho"
    DELETE Endpoint "/carrinhos/cancelar-compra"
    Validar Status Code "200"
    Validar message: "Registro excluído com sucesso. Estoque dos produtos reabastecido"

Cenário: POST Cadastar um Carrinho Vazio 400
    [tags]      POST400.2
    Fazer Login e Armazenar Token
    Pega Carrinho Estatico      carrinho3
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar produtos: "produtos não contém 1 valor obrigatório"

Cenário: POST Cadastrar Carrinho com Produto Inexistente 400
    [tags]      POST400.3
    Fazer Login e Armazenar Token
    Pega Carrinho Estatico      carrinho4
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar message: "Produto não encontrado"

Cenário: POST Cadastrar Carrinho com Quantidade Indisponível de Produtos 400
    [tags]      POST400.4
    Fazer Login e Armazenar Token
    Pega Carrinho Estatico      carrinho5
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar message: "Produto não possui quantidade suficiente"

Cenário: POST Cadastrar Carrinho com Produto Duplicado 400
    [tags]      POST400.5
    Fazer Login e Armazenar Token
    Pega Carrinho Estatico      carrinho6
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar message: "Não é permitido possuir produto duplicado"

Cenário: POST Erro no Token 401
    [tags]      POST401
    Pega Carrinho Estatico      carrinho2
    POST Carrinho Sem Token
    Validar Status Code "401"
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"


# ----------------------- DELETE -----------------------
Cenário: DELETE Concluir Compra e Excluir Carrinho 200
    [tags]      DELETE200.1
    Fazer Login e Armazenar Token
    Pega Carrinho Estatico      carrinho1
    POST Endpoint /carrinhos
    Validar Status Code "201"
    Validar Quantidade de Produtos no Estoque   carrinho1
    DELETE Endpoint "/carrinhos/concluir-compra"
    Validar Status Code "200"
    Validar message: "Registro excluído com sucesso"
    Validar se Produtos Foram Retornados ao Estoque     carrinho1

Cenário: DELETE Concluir Compra de Usuário Sem Carrinho 200
    [tags]      DELETE200.2
    Fazer Login e Armazenar Token
    DELETE Endpoint "/carrinhos/concluir-compra"
    Validar Status Code "200"
    Validar message: "Não foi encontrado carrinho para esse usuário"

Cenário: DELETE Concluir Compra com Erro no Token 401
    [tags]      DELETE401.1
    DELETE Endpoint "/carrinhos/concluir-compra" Sem Token
    Validar Status Code "401"
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: DELETE Excluir Carrinho e Retornar Produtos ao Estoque 200
    [tags]      DELETE200.3
    Fazer Login e Armazenar Token
    Pega Carrinho Estatico      carrinho1
    POST Endpoint /carrinhos
    Validar Status Code "201"
    Validar Quantidade de Produtos no Estoque   carrinho1
    DELETE Endpoint "/carrinhos/cancelar-compra"
    Validar Status Code "200"
    Validar message: "Registro excluído com sucesso. Estoque dos produtos reabastecido"
    Validar se Produtos Foram Retornados ao Estoque     carrinho1

Cenário: DELETE Excluir Carrinho para Usuario Sem Carrinho 200
    [tags]      DELETE200.4
    Fazer Login e Armazenar Token
    DELETE Endpoint "/carrinhos/cancelar-compra"
    Validar Status Code "200"
    Validar message: "Não foi encontrado carrinho para esse usuário"

Cenário: DELETE Cancelar Compra com Erro no Token 401
    [tags]      DELETE401.2
    DELETE Endpoint "/carrinhos/cancelar-compra" Sem Token
    Validar Status Code "401"
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"