* Settings *
Documentation   Arquivo para as Keywords do Endpoint /carrinhos
Resource        ../support/base.robot
Resource        ./login_keywords.robot

#Área para desenvolver as keywords utilizadas nos casos de teste
* Keywords *

GET Endpoint /carrinhos
    ${response}                 GET On Session     serverest    /carrinhos
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

GET Endpoint /carrinhos id "${id}"
    ${response}                 GET On Session     serverest    /carrinhos/${id}      expected_status=anything
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

Validar id: "${id}"
    Should Match                ${response.json()["_id"]}        ${id}

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

DELETE Endpoint "${endpoint}"
    ${header}                   Create Dictionary       Authorization=${token_auth}
    ${response}                 DELETE On Session       serverest       ${endpoint}     expected_status=anything    headers=${header}
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

DELETE Endpoint "${endpoint}" Sem Token
    ${response}                 DELETE On Session       serverest       ${endpoint}      expected_status=anything
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}