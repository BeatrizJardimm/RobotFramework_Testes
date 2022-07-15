# Esse arquivo contém os Test Cases que se referem ao POST do Endpoint /carrinhos
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

# Área para definir as configurações do arquivo
* Settings *
Documentation   Arquivo simples para requisições POST no Endpoint /carrinhos
Library         RequestsLibrary
Resource        ../common.robot
Resource        ../login/keywordsLogin.robot

#Área para escrever os casos que serão testados
* Test Cases *

Cenário: POST Cadastrar Carrinho 201
    [tags]      POST201
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"

Cenário: POST Erro no Cadastro 400
    [tags]      POST400
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Outro Carrinho Estatico Valido Para o Mesmo Usuario
    Validar Status Code "400"

Cenário: POST Erro no Token 401
    [tags]      POST401
    Criar Sessao
    POST Carrinho Sem Token
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

#Área para desenvolver as keywords utilizadas nos casos de teste
* Keywords *

Criar Carrinho Estatico Valido
    ${json}                     Importar JSON Estatico      json_carrinhos_ex.json
    ${payload}                  Set Variable                ${json["carrinho1"]}
    Set Global Variable         ${payload}
    POST Endpoint /carrinhos

Criar Outro Carrinho Estatico Valido Para o Mesmo Usuario
    ${json}                     Importar JSON Estatico      json_carrinhos_ex.json
    ${payload}                  Set Variable                ${json["carrinho2"]}
    Set Global Variable         ${payload}
    POST Outro Carrinho para Mesmo Usuario

Criar Carrinho para Token Inválido
    ${json}                     Importar JSON Estatico      json_carrinhos_ex.json
    ${payload}                  Set Variable                ${json["carrinho2"]}
    Set Global Variable         ${payload}
    POST Carrinho Sem Token

POST Endpoint /carrinhos
    ${header}                   Create Dictionary       Authorization=${token_auth}
    ${response}                 POST On Session         serverest       /carrinhos        json=${payload}   expected_status=anything    headers=${header}
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

POST Outro Carrinho para Mesmo Usuario
    ${header}                   Create Dictionary       Authorization=${token_auth}
    ${response}                 POST On Session         serverest       /carrinhos      json=${payload}      expected_status=anything    headers=${header}
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

POST Carrinho Sem Token
    ${response}                 POST On Session         serverest       /carrinhos        json=${payload}      expected_status=anything
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}