# Esse arquivo contém os Test Cases que se referem ao GET do Endpoint /produtos
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs
Library         RequestsLibrary

* Variables *


* Test Cases *

Cenário: GET Todos os Produtos 200
    Criar Sessao
    GET Endpoint /produtos
    Validar Status Code "200"

Cenário: GET Produto Específico 200
    Criar Sessao
    GET Endpoint /produtos id "BeeJh5lz3k6kSIzA"
    Validar Status Code "200"
#    Validar Mensagem: "Nome - Logitech MX Vertical"

Cenário: GET Produto Inexistente 400
    Criar Sessao
    GET Endpoint /produtos id "Inexistente"
    Validar Status Code "400"
#    Validar Mensagem: "Produto não encontrado"

* Keywords *
Criar Sessao
    Create Session          serverest       https://serverest.dev

GET Endpoint /produtos
    ${response}             GET On Session     serverest       /produtos
    Set Global Variable     ${response}

GET Endpoint /produtos id "${id}"
    ${response}             GET On Session     serverest       /produtos/${id}      expected_status=anything
    Set Global Variable     ${response}

Validar Status Code "${statuscode}"
    Should Be True          ${response.status_code} == ${statuscode}