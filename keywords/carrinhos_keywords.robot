* Settings *
Documentation   Arquivo para as Keywords do Endpoint /carrinhos
Resource        ../support/base.robot
Resource        ./login_keywords.robot

* Variables *

${token_expirado}   Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImV2ZXJtb3JlQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoicmVwdXRhdGlvbiIsImlhdCI6MTY1ODg4Mzk3MywiZXhwIjoxNjU4ODg0NTczfQ.GCSrd-ffbl2Cx2jgMa8VCMQ4EuA_qJP61DQJgS_y-Kg

#Área para desenvolver as keywords utilizadas nos casos de teste
* Keywords *

Pega Carrinho Estatico
    [Arguments]                 ${carrinho}
    ${json}                     Importar JSON Estatico      json_carrinhos_ex.json
    ${payload}                  Set Variable                ${json["${carrinho}"]}
    Set Global Variable         ${payload}

Quantidade Inicial de Produtos no Estoque
    [Arguments]                 ${carrinho}
    Pega Carrinho Estatico      ${carrinho}
    ${idProduto}                Set Variable                ${payload["produtos"][0]["idProduto"]}
    ${response}                 GET On Session              serverest           /produtos/${idProduto}
    Log To Console              \nQuantidade de produtos no estoque: ${response.json()["quantidade"]}

Validar Quantidade de Produtos no Estoque
    [Arguments]                 ${carrinho}
    Pega Carrinho Estatico      ${carrinho}
    ${idProduto}                Set Variable                ${payload["produtos"][0]["idProduto"]}
    ${response}                 GET On Session              serverest           /produtos/${idProduto}
    Log To Console              Quantidade de produtos adicionada ao carrinho: ${payload["produtos"][0]["quantidade"]}
    Log To Console              Quantidade de produtos no estoque: ${response.json()["quantidade"]}

Validar se Produtos Foram Retornados ao Estoque
    [Arguments]                 ${carrinho}
    Pega Carrinho Estatico      ${carrinho}
    ${idProduto}                Set Variable                ${payload["produtos"][0]["idProduto"]}
    ${response}                 GET On Session              serverest           /produtos/${idProduto}
    Log To Console              Quantidade comprada ou retornada ao estoque: ${payload["produtos"][0]["quantidade"]} 
    Log To Console              Quantidade no Estoque: ${response.json()["quantidade"]}

# ----------------------- GET -----------------------
GET Endpoint /carrinhos
    ${response}                 GET On Session          serverest       /carrinhos
    Set Global Variable         ${response}
    Log To Console              ${response.json()}

GET Endpoint /carrinhos id "${id}"
    ${response}                 GET On Session          serverest       /carrinhos/${id}      expected_status=anything
    Set Global Variable         ${response}


# ----------------------- POST -----------------------
POST Endpoint /carrinhos
    ${header}                   Create Dictionary       Authorization=${token_auth}
    ${response}                 POST On Session         serverest       /carrinhos            json=${payload}   expected_status=anything    headers=${header}
    Set Global Variable         ${response}

POST Outro Carrinho para Mesmo Usuario
    ${header}                   Create Dictionary       Authorization=${token_auth}
    ${response}                 POST On Session         serverest       /carrinhos            json=${payload}      expected_status=anything    headers=${header}
    Set Global Variable         ${response}

POST Carrinho Sem Token
    ${response}                 POST On Session         serverest       /carrinhos            json=${payload}      expected_status=anything
    Set Global Variable         ${response}

POST Carrinho Token Invalido
    ${header}                   Create Dictionary       Authorization=Invalido
    ${response}                 POST On Session         serverest       /carrinhos            json=${payload}   expected_status=anything    headers=${header}
    Set Global Variable         ${response}

POST Carrinho Token Expirado
    ${header}                   Create Dictionary       Authorization=${token_expirado}
    ${response}                 POST On Session         serverest       /carrinhos            json=${payload}   expected_status=anything    headers=${header}
    Set Global Variable         ${response}

# ----------------------- DELETE -----------------------
DELETE Endpoint "${endpoint}"
    ${header}                   Create Dictionary       Authorization=${token_auth}
    ${response}                 DELETE On Session       serverest       ${endpoint}           expected_status=anything    headers=${header}
    Set Global Variable         ${response}

DELETE Endpoint "${endpoint}" Sem Token
    ${response}                 DELETE On Session       serverest       ${endpoint}           expected_status=anything
    Set Global Variable         ${response}

DELETE Endpoint "${endpoint}" Token Invalido
    ${header}                   Create Dictionary       Authorization=Invalido
    ${response}                 DELETE On Session       serverest       ${endpoint}           expected_status=anything    headers=${header}
    Set Global Variable         ${response}

DELETE Endpoint "${endpoint}" Token Expirado
    ${header}                   Create Dictionary       Authorization=${token_expirado}
    ${response}                 DELETE On Session       serverest       ${endpoint}           expected_status=anything    headers=${header}
    Set Global Variable         ${response}