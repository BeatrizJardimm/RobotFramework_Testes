# Esse arquivo contém os Test Cases que se referem ao PUT do Endpoint /usuarios
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Test Cases *

Cenário: PUT Editar Usuario Existente 200
    PUT Editar Usuario de id "/0uxuPY0cbmQhpEz1" Usando Dados Dinâmicos
    Validar Status Code "200"
    Validar Mensagem: "Registro alterado com sucesso"

Cenário: PUT Cadastrar novo Usuario 201
    PUT Criar Usuário Com Uma Nova id no Endpoint /usuarios
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"

Cenário: PUT Mudar Email de um Usuário para outro que já está Sendo Utilizado 400
    PUT no Endpoint /usuarios/0uxuPY0cbmQhpEz1 Colocar um Email que está sendo Utilizado por outro Usuario
    Validar Status Code "400"
    Validar Mensagem: "Este email já está sendo usado"