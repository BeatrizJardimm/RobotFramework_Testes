# Esse arquivo contém os Test Cases que se referem ao GET do Endpoint /carrinhos
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs
Library         RequestsLibrary

* Variables *


* Test Cases *

Cenário: GET Todos os Carrinhos 200
    Criar Sessao
    GET Endpoint /carrinhos
    Validar o Status Code "200"

Cenário: GET Carrinho Específico 200
    Criar Sessao
    GET Endpoint /carrinhos id "/qbMqntef4iTOwWfg"
    Validar Status Code "200"
#    Validar Mensagem: "_id - qbMqntef4iTOwWfg"

Cenário: GET Carrinho Inexistente 400
    Criar Sessao
    GET Endpoint /carrinhos id "Inexistente"
    Validar Status Code "400"
#    Validar Mensagem: "Carrinho não encontrado"

* Keywords *

Criar Sessao
    Create Session          serverest       https://serverest.dev

GET Endpoint /carrinhos
    ${response}             GET On Session     serverest    /carrinhos
    Set Global Variable     ${response}

GET Endpoint /carrinhos id "${id}"
    ${response}             GET On Session     serverest    /carrinhos/${id}      expected_status=anything
    Set Global Variable     ${response}

Validar Status Code "${id}"
    Should Be True          ${response.status_code} == ${statuscode}