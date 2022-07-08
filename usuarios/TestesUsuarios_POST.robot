# Esse arquivo contém os Test Cases que se referem ao POST do Endpoint /usuarios
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs
Library         RequestsLibrary

* Variables *


* Test Cases *

Cenário: POST Cadastrar Novo Usuario 201
    Criar Sessao
    Criar Usuario Dinâmico
    POST Usuario Dinâmico no Endpoint /usuarios
    Validar Status Code "201"
#    Validar Mensagem: "Cadastro realizado com sucesso"

Cenário: POST Cadastrar Novo Usuário com Email Já Cadastrado 400
    Criar Sessao
    POST Usuário Dinâmico com Email já Cadastrado no Endpoint /usuarios
    Validar Status Code "400"
#    Validar Mensagem: "Este email já está sendo usado"

* Keywords *
Criar Sessao
    Create Session          serverest       https://serverest.dev


Validar Status Code "${statuscode}"
    Should Be True          ${response.status_code} == ${statuscode}