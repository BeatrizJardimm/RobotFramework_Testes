# Esse arquivo contém os Test Cases que se referem ao POST do Endpoint /produtos
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs
Library         RequestsLibrary
Resource        ../common.robot
Resource        ../login/keywordsLogin.robot

* Test Cases *

#rodar com token válido
Cenário: POST Cadastrar Novo Produto 201
    [tags]      POST201
    Criar Sessao
    Fazer Login e Armazenar Token
    Cadastra Produto Estatico Valido
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"

#utilizar o mesmo produto que foi cadastrado com o test case anterior
Cenário: POST Cadastrar Produto Existente 400
    [tags]      POST400
    Criar Sessao
    Fazer Login e Armazenar Token
    Cadastra Produto Estatico Invalido
    Validar Status Code "400"
    Validar Mensagem: "Já existe produto com esse nome"

#rodar com um token inválido
Cenário: POST Erro no Token 401
    [tags]      POST401.1
    Criar Sessao
    Cadastra Produto Sem Token
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

* Keywords *

Cadastra Produto Estatico Valido
    ${json}                 Importar JSON Estatico      json_produtos_ex.json
    ${payload}              Set Variable                ${json["produto_valido"]}
    Set Global Variable     ${payload}
    POST Endpoint /produtos

Cadastra Produto Estatico Invalido
    ${json}                 Importar JSON Estatico      json_produtos_ex.json
    ${payload}              Set Variable                ${json["produto_invalido"]}
    Set Global Variable     ${payload}
    POST Endpoint /produtos

Cadastra Produto Sem Token
    ${json}                 Importar JSON Estatico      json_produtos_ex.json
    ${payload}              Set Variable                ${json["produto_valido"]}
    Set Global Variable     ${payload}
    POST Sem Token

POST Endpoint /produtos
    &{header}               Create Dictionary   Authorization=${token_auth}
    ${response}             POST On Session     serverest       /produtos       json=${payload}     expected_status=anything    headers=${header}
    Set Global Variable     ${response}

POST Sem Token
    ${response}             POST On Session     serverest       /produtos       json=${payload}     expected_status=anything
    Set Global Variable     ${response}