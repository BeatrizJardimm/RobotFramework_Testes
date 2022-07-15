# Esse arquivo contém os Test Cases que se referem ao GET do Endpoint /produtos
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Settings *
Documentation   Arquivo simples para requisições GET no Endpoint /produtos
Library         RequestsLibrary
Resource        ../common.robot

* Test Cases *

Cenário: GET Todos os Produtos 200
    [tags]      GET200.1
    Criar Sessao
    GET Endpoint /produtos
    Validar Status Code "200"

Cenário: GET Produto Específico 200
    [tags]      GET200.2
    Criar Sessao
    GET Endpoint /produtos id "BeeJh5lz3k6kSIzA"
    Validar Status Code "200"
    Validar Nome: "Logitech MX Vertical"

Cenário: GET Produto Inexistente 400
    [tags]      GET400
    Criar Sessao
    GET Endpoint /produtos id "Inexistente"
    Validar Status Code "400"
    Validar Mensagem: "Produto não encontrado"

* Keywords *
GET Endpoint /produtos
    ${response}             GET On Session     serverest       /produtos
    Printar Conteudo Response    ${response}
    Set Global Variable     ${response}

GET Endpoint /produtos id "${id}"
    ${response}             GET On Session     serverest       /produtos/${id}      expected_status=anything
    Set Global Variable     ${response}