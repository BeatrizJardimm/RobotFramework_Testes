# Esse arquivo contém os Test Cases que se referem ao Endpoint /login
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs
Library         RequestsLibrary

* Variables *


* Test Cases *

Cenario: POST Realizar Login 200
    [tags]  	login200
    Criar Sessao
    POST Email "fulano@qa.com" Senha "teste"
    Validar Status Code "200"
    Validar Mensagem: "Login realizado com sucesso"

Cenario: POST Realizar Login com Email Invalido 401
    [tags]  	login401.1
    Criar Sessao
    POST Email "invalido@qa.com" Senha "teste"
    Validar Status Code "401"
    Validar Mensagem: "Email e/ou senha inválidos"

Cenario: POST Realizar Login com Senha Invalida 401
    [tags]  	login401.2
    Criar Sessao
    POST Email "fulano@qa.com" Senha "Invalida"
    Validar Status Code "401"
    Validar Mensagem: "Email e/ou senha inválidos"

* Keywords *
Criar Sessao
    Create Session          serverest       https://serverest.dev

POST Email "${email}" Senha "${senha}"
    &{payload}              Create Dictionary     email=${email}     password=${senha}
    ${response}             POST On Session       serverest      /login      data=&{payload}       json=None      expected_status=anything       msg=None
    Set Global Variable     ${response}

Validar Status Code "${statuscode}"
    Should Be True          ${response.status_code} == ${statuscode}

Validar Mensagem: "${mensagem}"
    Should Match          ${response.json()["message"]}       ${mensagem}