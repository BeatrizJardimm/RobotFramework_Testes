# Esse arquivo contém os Test Cases que se referem ao GET do Endpoint /usuarios
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro


# Área para definir as configurações do arquivo
* Settings *
Documentation   Arquivo simples para requisições GET do Endpoint /usuarios
Library         RequestsLibrary
Resource        ../common.robot

#Área para escrever os casos que serão testados
* Test Cases *

Cenário: GET Todos os Usuários 200
    [tags]      GET200.1
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Quantidade ${4}

Cenário: GET Usuário Específico 200
    [tags]      GET200.2
    Criar Sessao
    GET Endpoint /usuarios id "CNR4yVgA8tQfkvqv"
    Validar Status Code "200"
    Validar Nome: "Taylor Swift"

Cenário: GET Usuário Inexistente 400
    [tags]      GET400
    Criar Sessao
    GET Endpoint /usuarios id "Inexistente"
    Validar Status Code "400"
    Validar Mensagem: "Usuário não encontrado"

#Área para desenvolver as keywords utilizadas nos casos de teste
* Keywords *

GET Endpoint /usuarios
    ${response}                     GET On Session     serverest       /usuarios
    Printar Conteudo Response       ${response}
    Set Global Variable             ${response}

GET Endpoint /usuarios id "${id}"
    ${response}                     GET On Session     serverest       /usuarios/${id}      expected_status=anything
    Printar Conteudo Response       ${response}
    Set Global Variable             ${response}

Validar Quantidade ${qnt}
    Should Be Equal                 ${response.json()["quantidade"]}    ${qnt}