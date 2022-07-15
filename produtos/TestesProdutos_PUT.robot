# Esse arquivo contém os Test Cases que se referem ao PUT do Endpoint /produtos
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Settings *
Documentation   Arquivo simples para requisições PUT no Endpoint /produtos
Library         RequestsLibrary
Resource        ../common.robot
Resource        ../login/keywordsLogin.robot

* Test Cases *

#usar um token válido
Cenário: PUT Editar Produto Existente 200
    [tags]      PUT200
    Criar Sessao
    Fazer Login e Armazenar Token
    Edita Produto Valido    BeeJh5lz3k6kSIzA 
    Validar Status Code "200"
    Validar Mensagem: "Registro alterado com sucesso"

#rodar com um token válido
Cenário: PUT Cadastrar Novo Produto 201
    [tags]      PUT201
    Criar Sessao
    Fazer Login e Armazenar Token
    Cria Produto Valido
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"

# utiliza a id de outro produto, mas a keyword é a mesma, pois para esse teste precisamos utilizar o mesmo nome do produto de antes
Cenário: PUT Editar Para Nome já Existente 400
    [tags]  	PUT400
    Criar Sessao
    Fazer Login e Armazenar Token
    Edita Produto Valido    K6leHdftCeOJj8BJ
    Validar Status Code "400"
    Validar Mensagem: "Já existe produto com esse nome"

#rodar com token ausente (sem token)
Cenário: PUT Erro no Token 401
    [tags]      PUT401
    Criar Sessao
    PUT Sem Token
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

* Keywords *
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

Edita Produto Valido
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