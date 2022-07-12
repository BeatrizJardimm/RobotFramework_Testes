# Esse arquivo contém os Test Cases que se referem ao GET do Endpoint /carrinhos
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

# Área para definir as configurações do arquivo
* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs
Library         RequestsLibrary

# Área para setar as váriaveis do projeto
* Variables *


#Área para escrever os casos que serão testados
* Test Cases *

Cenário: GET Todos os Carrinhos 200
    [tags]      GET200.1
    Criar Sessao
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenário: GET Carrinho Específico 200
    [tags]      GET200.2
    Criar Sessao
    GET Endpoint /carrinhos id "/qbMqntef4iTOwWfg"
    Validar Status Code "200"
    Validar id: "qbMqntef4iTOwWfg"

Cenário: GET Carrinho Inexistente 400
    [tags]      GET400
    Criar Sessao
    GET Endpoint /carrinhos id "Inexistente"
    Validar Status Code "400"
    Validar Mensagem: "Carrinho não encontrado"


#Área para desenvolver as keywords utilizadas nos casos de teste
* Keywords *

Criar Sessao
    Create Session          serverest       http://localhost:3000

GET Endpoint /carrinhos
    ${response}             GET On Session     serverest    /carrinhos
    Set Global Variable     ${response}

GET Endpoint /carrinhos id "${id}"
    ${response}             GET On Session     serverest    /carrinhos/${id}      expected_status=anything
    Set Global Variable     ${response}

Validar Status Code "${statuscode}"
    Should Be True          ${response.status_code} == ${statuscode}

Validar id: "${id}"
    Should Match    ${response.json()["_id"]}       ${id}

Validar Mensagem: "${mensagem}"
    Should Match    ${response.json()["message"]}     ${mensagem}