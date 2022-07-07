# Esse arquivo contém os Test Cases que se referem ao GET do Endpoint /produtos
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Test Cases *

Cenário: GET Todos os Produtos 200
    GET Endpoint /produtos
    Validar Todos os Produtos
    Validar o Status Code "200"

Cenário: GET Produto Específico 200
    GET Endpoint /produtos com id "/BeeJh5lz3k6kSIzA"
    Validar Produto com id "/BeeJh5lz3k6kSIzA"
    Validar Status Code "200"
    Validar Mensagem: "Nome - Logitech MX Vertical"

Cenário: GET Produto Inexistente 400
    GET Endpoint /produtos com id Inexistente
    Validar Status Code "400"
    Validar Mensagem: "Produto não encontrado"