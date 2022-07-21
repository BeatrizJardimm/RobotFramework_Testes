* Settings *
Documentation   Arquivo para as Keywords do Endpoint /carrinhos
Resource        ../support/base.robot
Resource        ./login_keywords.robot

#Área para desenvolver as keywords utilizadas nos casos de teste
* Keywords *

Validar id: "${id}"
    Should Match                ${response.json()["_id"]}        ${id}

Pega Carrinho Estatico
    [Arguments]                 ${carrinho}
    ${json}                     Importar JSON Estatico      json_carrinhos_ex.json
    ${payload}                  Set Variable                ${json["${carrinho}"]}
    Set Global Variable         ${payload}

GET Endpoint /carrinhos
    ${response}                 GET On Session          serverest       /carrinhos
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

GET Endpoint /carrinhos id "${id}"
    ${response}                 GET On Session          serverest       /carrinhos/${id}      expected_status=anything
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

POST Endpoint /carrinhos
    ${header}                   Create Dictionary       Authorization=${token_auth}
    ${response}                 POST On Session         serverest       /carrinhos            json=${payload}   expected_status=anything    headers=${header}
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

POST Outro Carrinho para Mesmo Usuario
    ${header}                   Create Dictionary       Authorization=${token_auth}
    ${response}                 POST On Session         serverest       /carrinhos            json=${payload}      expected_status=anything    headers=${header}
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

POST Carrinho Sem Token
    ${response}                 POST On Session         serverest       /carrinhos            json=${payload}      expected_status=anything
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

DELETE Endpoint "${endpoint}"
    ${header}                   Create Dictionary       Authorization=${token_auth}
    ${response}                 DELETE On Session       serverest       ${endpoint}           expected_status=anything    headers=${header}
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

DELETE Endpoint "${endpoint}" Sem Token
    ${response}                 DELETE On Session       serverest       ${endpoint}           expected_status=anything
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}