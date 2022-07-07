# Esse arquivo contém os Test Cases que se referem ao GET do Endpoint /carrinhos
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Test Cases *

Cenário: GET Todos os Carrinhos 200
    GET Endpoint /carrinhos
    Validar Todos os Carrinhos
    Validar o Status Code "200"

Cenário: GET Carrinho Específico 200
    GET Endpoint /carrinhos com id "/qbMqntef4iTOwWfg"
    Validar Carrinho com id "/qbMqntef4iTOwWfg"
    Validar Status Code "200"
    Validar Mensagem: "_id - qbMqntef4iTOwWfg"

Cenário: GET Carrinho Inexistente 400
    GET Endpoint /carrinhos com id Inexistente
    Validar Status Code "400"
    Validar Mensagem: "Carrinho não encontrado"