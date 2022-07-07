# Esse arquivo contém os Test Cases que se referem ao GET do Endpoint /usuarios
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Test Cases *

Cenário: GET Todos os Usuários 200
    GET Endpoint /usuarios
    Validar Todos os Usuarios
    Validar Status Code "200"

Cenário: GET Usuário Específico 200
    GET Endpoint /usuarios com id "/0uxuPY0cbmQhpEz1"
    Validar Status Code "200"
    Validar Mensagem: "Nome - Fulano da Silva"

Cenário: GET Usuário Inexistente 400
    GET Endpoint /usuarios com id Inexistente
    Validar Status Code "400"
    Validar Mensagem: "Usuário não encontrado"