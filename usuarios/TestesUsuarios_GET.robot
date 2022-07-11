# Esse arquivo contém os Test Cases que se referem ao GET do Endpoint /usuarios
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs
Library         RequestsLibrary

* Variables *


* Test Cases *

Cenário: GET Todos os Usuários 200
    [tags]      GET200.1
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Quantidade ${2}

Cenário: GET Usuário Específico 200
    [tags]      GET200.2
    Criar Sessao
    GET Endpoint /usuarios id "C1Z6OM3q72545ziL"
    Validar Status Code "200"
    Validar Nome: "jarbas janvas"

Cenário: GET Usuário Inexistente 400
    [tags]      GET400
    Criar Sessao
    GET Endpoint /usuarios id "Inexistente"
    Validar Status Code "400"
    Validar Mensagem: "Usuário não encontrado"

* Keywords *
Criar Sessao
    Create Session          serverest          https://serverest.dev

GET Endpoint /usuarios
    ${response}             GET On Session     serverest       /usuarios
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

GET Endpoint /usuarios id "${id}"
    ${response}             GET On Session     serverest       /usuarios/${id}      expected_status=anything
    Set Global Variable     ${response}

Validar Status Code "${statuscode}"
    Should Be True          ${response.status_code} == ${statuscode}

Validar Quantidade ${qnt}
    Should Be Equal         ${response.json()["quantidade"]}    ${qnt}

Validar Mensagem: "${mensagem}"
    Should Match            ${response.json()["message"]}       ${mensagem}

Validar Nome: "${nome}"
    Should Match            ${response.json()["nome"]}          ${nome}