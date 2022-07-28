* Settings *
Documentation   Arquivo para as Keywords do Endpoint /produtos
Resource        ../support/base.robot

* Keywords *

#mesma keyword está sendo usada em vários test cases mudando apenas o argumento passado
Pega Produto Estatico
    [Arguments]                 ${estado}
    ${json}                     Importar JSON Estatico      json_produtos_ex.json
    ${payload}                  Set Variable                ${json["produto_${estado}"]}
    Set Global Variable         ${payload}


# ----------------------- GET -----------------------
GET Endpoint /produtos
    ${response}                  GET On Session     serverest       /produtos
    Set Global Variable          ${response}

GET Endpoint /produtos id "${id}"
    ${response}                  GET On Session     serverest       /produtos/${id}      expected_status=anything
    Set Global Variable          ${response}


# ----------------------- POST -----------------------
POST Endpoint /produtos
    &{header}                   Create Dictionary           Authorization=${token_auth}
    ${response}                 POST On Session             serverest       /produtos       json=${payload}     expected_status=anything    headers=${header}
    Set Global Variable         ${response}

POST Sem Token
    ${response}                 POST On Session             serverest       /produtos       json=${payload}     expected_status=anything
    Set Global Variable         ${response}

POST Token Invalido
    &{header}                   Create Dictionary            Authorization=Invalido
    ${response}                 POST On Session              serverest       /produtos       json=${payload}    expected_status=anything
    Set Global Variable         ${response}

POST Token Expirado
    &{header}                   Create Dictionary            Authorization=${token_expirado}
    ${response}                 POST On Session              serverest       /produtos       json=${payload}    expected_status=anything
    Set Global Variable         ${response}

# ----------------------- PUT -----------------------
PUT id "${id}"
    &{header}                   Create Dictionary          Authorization=${token_auth}
    ${response}                 PUT On Session             serverest       /produtos/${id}     json=${payload}      expected_status=anything     headers=${header}
    Set Global Variable         ${response}

PUT Novo Produto
    &{header}                   Create Dictionary           Authorization=${token_auth}
    ${response}                 PUT On Session              serverest       /produtos/0uxuPY0cbmQhpEz1       json=${payload}    expected_status=anything    headers=${header}
    Set Global Variable         ${response}

PUT Sem Token
    ${response}                 PUT On Session              serverest       /produtos/0uxuPY0cbmQhpEz1       json=${payload}    expected_status=anything
    Set Global Variable         ${response}

PUT Token Invalido
    &{header}                   Create Dictionary           Authorization=Invalido
    ${response}                 PUT On Session              serverest       /produtos/0uxuPY0cbmQhpEz1       json=${payload}    expected_status=anything
    Set Global Variable         ${response}

PUT Token Expirado
    &{header}                   Create Dictionary           Authorization=${token_expirado}
    ${response}                 PUT On Session              serverest       /produtos/0uxuPY0cbmQhpEz1       json=${payload}    expected_status=anything
    Set Global Variable         ${response}


# ----------------------- DELETE -----------------------
DELETE id "${id}"
    ${header}                   Create Dictionary     Authorization=${token_auth}
    ${response}                 DELETE On Session     serverest       /produtos/${id}      expected_status=anything    headers=${header}
    Set Global Variable         ${response}

DELETE Sem Token
    ${response}                 DELETE On Session     serverest       /produtos/0uxuPY0cbmQhpEz1      expected_status=anything
    Set Global Variable         ${response}

DELETE Token Invalido
    ${header}                   Create Dictionary     Authorization=Invalido
    ${response}                 DELETE On Session     serverest       /produtos/0uxuPY0cbmQhpEz1      expected_status=anything    headers=${header}
    Set Global Variable         ${response}

DELETE Token Expirado
    ${header}                   Create Dictionary     Authorization=${token_expirado}
    ${response}                 DELETE On Session     serverest       /produtos/0uxuPY0cbmQhpEz1      expected_status=anything    headers=${header}
    Set Global Variable         ${response}