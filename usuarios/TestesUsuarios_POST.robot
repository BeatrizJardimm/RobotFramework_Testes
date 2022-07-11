# Esse arquivo contém os Test Cases que se referem ao POST do Endpoint /usuarios
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs
Library         RequestsLibrary

* Variables *


* Test Cases *

Cenário: POST Cadastrar Novo Usuario 201
    [tags]      POST200
    Criar Sessao
#    Criar Usuario Dinâmico
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"

Cenário: POST Cadastrar Novo Usuário com Email Já Cadastrado 400
    [tags]      POST400
    Criar Sessao
    POST Email já Cadastrado
    Validar Status Code "400"
    Validar Mensagem: "Este email já está sendo usado"

* Keywords *
Criar Sessao
    Create Session          serverest           https://serverest.dev

POST Endpoint /usuarios
    &{payload}              Create Dictionary   nome=Lana Del Rey   email=stargirlinterlude@gmail.com   password=ultraviolence     administrador=true
    ${response}             POST On Session     serverest           /usuarios           data=&{payload}     json=None      expected_status=anything
    Log To Console          ${response.content}
    Set Global Variable     ${response}

POST Email já Cadastrado
    &{payload}              Create Dictionary   nome=Frank Ocean   email=stargirlinterlude@gmail.com   password=ivy     administrador=true
    ${response}             POST On Session     serverest           /usuarios           data=&{payload}     json=None      expected_status=anything
    Log To Console          ${response.content}
    Set Global Variable     ${response}

Validar Status Code "${statuscode}"
    Should Be True          ${response.status_code} == ${statuscode}

Validar Mensagem: "${mensagem}"
    Should Match            ${response.json()["message"]}       ${mensagem}    