# Esse arquivo contém os Test Cases que se referem ao GET do Endpoint /usuarios
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs
Library         RequestsLibrary

* Variables *


* Test Cases *

Cenário: GET Todos os Usuários 200
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenário: GET Usuário Específico 200
    Criar Sessao
    GET Endpoint /usuarios id "0uxuPY0cbmQhpEz1"
    Validar Status Code "200"
    #Validar Mensagem: "Nome - Fulano da Silva"

Cenário: GET Usuário Inexistente 400
    Criar Sessao
    GET Endpoint /usuarios id "Inexistente"
    Validar Status Code "400"
    #Validar Mensagem: "Usuário não encontrado"

* Keywords *
Criar Sessao
    Create Session          serverest       https://serverest.dev

GET Endpoint /usuarios
    ${response}             GET On Session     serverest       /usuarios
    Set Global Variable     ${response}

GET Endpoint /usuarios id "${id}"
    ${response}             GET On Session     serverest       /usuarios/${id}      expected_status=anything
    Set Global Variable     ${response}

Validar Status Code "${statuscode}"
    Should Be True          ${response.status_code} == ${statuscode}

Validar Mensagem: "${mensagem}"
    Should Be True          ${response.message} == ${mensagem}