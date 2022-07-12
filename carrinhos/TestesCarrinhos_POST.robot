# Esse arquivo contém os Test Cases que se referem ao POST do Endpoint /carrinhos
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

Cenário: POST Cadastrar Carrinho 201
    [tags]      POST201
    Criar Sessao
    POST Endpoint "/carrinhos"
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"

Cenário: POST Erro no Cadastro 400
    [tags]      POST400
    Criar Sessao
    POST Outro Carrinho para Mesmo Usuario
    Validar Status Code "400"
    Validar Mensagem: "Não é permitido possuir produto duplicado | Não é permitido ter mais de 1 carrinho | Produto não encontrado | Produto não possui quantidade suficiente"

Cenário: POST Erro no Token 401
    [tags]      POST401
    Criar Sessao
    POST Carrinho Sem Token
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

#Área para desenvolver as keywords utilizadas nos casos de teste
* Keywords *

Criar Sessao
    Create Session              serverest       http://localhost:3000

POST Endpoint "${endpoint}"
    &{payload}                  Create Dictionary   produtos=[{ idProduto=BeeJh5lz3k6kSIzA       quantidade=4}]
    ${response}                 POST On Session     serverest       /${endpoint}        data=&{payload}     json=None   expected_status=anything
    Log To Console              ${response.content}
    Set Global Variables        ${response}

POST Outro Carrinho para Mesmo Usuario
    &{payload}                  Create Dictionary    produtos=[{ idProduto=BeeJh5lz3k6kSIzA       quantidade=2}, { idProduto=YaeJ455lz3k6kSIzA       quantidade=3}]
    ${response}                 POST On Session     serverest       /carrinhos           data=&{payload}     json=None      expected_status=anything
    Set Global Variable         ${response}

POST Carrinho Sem Token
    &{payload}                  Create Dictionary     produtos=[{ idProduto=YaeJ455lz3k6kSIzA       quantidade=1}]
    ${response}                 POST On Session       serverest       /carrinhos           data=&{payload}     json=None      expected_status=anything
    Set Global Variable         ${response}

Validar Status Code "${statuscode}"
    Should Be True              ${response.status_code} == ${statuscode}

Validar Mensagem: "${mensagem}"
    Should Match                ${response.json()["message"]}      ${mensagem}