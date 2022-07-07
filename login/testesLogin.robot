# Esse arquivo contém os Test Cases que se referem ao Endpoint /login
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Test Cases *

Cenário: POST Realizar Login 200
    POST no Endpoint /login o Email "fulano@qa.com" com a Senha "teste"
    Validar o Status Code "200"
    Validar Mensagem: "Login realizado com sucesso"

Cenário: POST Realizar Login com Email Inválido 400
    POST Email Inválido com a Senha "teste" no Endpoint /login
    Validar Status Code 400
    Validar Mensagem: "Email e/ou senha inválidos"

Cenário: POST Realizar Login com Senha Inválida 400
    POST Senha Inválida com o Email "fulano@qa.com" no Endpoint /login
    Validar Status Code "400"
    Validar Mensagem: "Email e/ou senha inválidos"