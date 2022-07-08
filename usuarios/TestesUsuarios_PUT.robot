# Esse arquivo contém os Test Cases que se referem ao PUT do Endpoint /usuarios
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs
Library         RequestsLibrary

* Variables *


* Test Cases *

Cenário: PUT Editar Usuario Existente 200
    Criar Sessao
    PUT Editar Usuario de id "/0uxuPY0cbmQhpEz1" Usando Dados Dinâmicos
    Validar Status Code "200"
#    Validar Mensagem: "Registro alterado com sucesso"

Cenário: PUT Cadastrar novo Usuario 201
    Criar Sessao
    PUT Criar Usuário Com Uma Nova id no Endpoint /usuarios
    Validar Status Code "201"
#    Validar Mensagem "Cadastro realizado com sucesso"

Cenário: PUT Mudar Email de um Usuário para outro que já está Sendo Utilizado 400
    Criar Sessao
    PUT no Endpoint /usuarios/0uxuPY0cbmQhpEz1 Colocar um Email que está sendo Utilizado por outro Usuario
    Validar Status Code "400"
#    Validar Mensagem: "Este email já está sendo usado"

* Keywords *
Criar Sessao
    Create Session          serverest       https://serverest.dev


Validar Status Code "${statuscode}"
    Should Be True          ${response.status_code} == ${statuscode}