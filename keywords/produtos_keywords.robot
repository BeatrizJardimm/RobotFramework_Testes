* Settings *
Documentation   Arquivo para as Keywords do Endpoint /produtos
Resource        ../support/base.robot
Resource        ./login_keywords.robot

* Keywords *
GET Endpoint /produtos
    ${response}                  GET On Session     serverest       /produtos
    Printar Conteudo Response    ${response}
    Set Global Variable          ${response}

GET Endpoint /produtos id "${id}"
    ${response}                  GET On Session     serverest       /produtos/${id}      expected_status=anything
    Printar Conteudo Response    ${response}
    Set Global Variable          ${response}

Cadastra Produto Estatico Valido
    ${json}                     Importar JSON Estatico      json_produtos_ex.json
    ${payload}                  Set Variable                ${json["produto_valido"]}
    Set Global Variable         ${payload}
    POST Endpoint /produtos

Cadastra Produto Estatico Invalido
    ${json}                     Importar JSON Estatico      json_produtos_ex.json
    ${payload}                  Set Variable                ${json["produto_invalido"]}
    Set Global Variable         ${payload}
    POST Endpoint /produtos

Cadastra Produto Estatico sem Email
    ${json}                     Importar JSON Estatico      json_produtos_ex.json
    ${payload}                  Set Variable                ${json["produto_sem_nome"]}
    Set Global Variable         ${payload}
    POST Endpoint /produtos

Cadastra Produto Estatico de Preco Invalido
    ${json}                     Importar JSON Estatico      json_produtos_ex.json
    ${payload}                  Set Variable                ${json["produto_preco_invalido"]}
    Set Global Variable         ${payload}
    POST Endpoint /produtos

Cadastra Produto Sem Token
    ${json}                     Importar JSON Estatico      json_produtos_ex.json
    ${payload}                  Set Variable                ${json["produto_valido"]}
    Set Global Variable         ${payload}
    POST Sem Token

POST Endpoint /produtos
    &{header}                   Create Dictionary           Authorization=${token_auth}
    ${response}                 POST On Session             serverest       /produtos       json=${payload}     expected_status=anything    headers=${header}
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

POST Sem Token
    ${response}                 POST On Session             serverest       /produtos       json=${payload}     expected_status=anything
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

PUT id "${id}"
    &{header}                   Create Dictionary          Authorization=${token_auth}
    ${response}                 PUT On Session             serverest       /produtos/${id}     json=${payload}      expected_status=anything     headers=${header}
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

PUT Novo Produto
    &{header}                   Create Dictionary           Authorization=${token_auth}
    ${response}                 PUT On Session              serverest       /produtos/0uxuPY0cbmQhpEz1       json=${payload}    expected_status=anything    headers=${header}
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

PUT Sem Token
    ${response}                 PUT On Session              serverest       /produtos/0uxuPY0cbmQhpEz1       json=${payload}    expected_status=anything
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

Edita Produto Estatico Valido
    [Arguments]                 ${id}
    ${json}                     Importar JSON Estatico      json_produtos_ex.json
    ${payload}                  Set Variable                ${json["produto_editado"]}
    Set Global Variable         ${payload}
    PUT id "${id}"

Cria Produto Valido
    ${json}                     Importar JSON Estatico      json_produtos_ex.json
    ${payload}                  Set Variable                ${json["produto_novo"]}
    Set Global Variable         ${payload}
    PUT Novo Produto

Edita Sem Token
    ${json}                     Importar JSON Estatico      json_produtos_ex.json
    ${payload}                  Set Variable                ${json["produto_novo"]}
    Set Global Variable         ${payload}
    PUT Sem Token

DELETE id "${id}"
    ${header}                   Create Dictionary     Authorization=${token_auth}
    ${response}                 DELETE On Session     serverest       /produtos/${id}      expected_status=anything    headers=${header}
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

DELETE Sem Token
    ${response}                 DELETE On Session     serverest       /produtos/0uxuPY0cbmQhpEz1      expected_status=anything
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}