# Esse arquivo contém os Test Cases que se referem ao DELETE do Endpoint /carrinhos
# Para montar esses Test Cases, foi utilizada a API ServeRest que pode ser encontrada em https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

# Área para definir as configurações do arquivo
* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs
Library         RequestsLibrary

# Área para setar as váriaveis do projeto
* Variables *


#Área para escrever os casos que serão testados
* Test Cases *

Cenário: DELETE Excluir Carrinho 200
    [tags]      DELETE200.1
    Criar Sessao
    DELETE Endpoint "/carrinhos/concluir-compra" Token "Válido"
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso | Não foi encontrado carrinho para esse usuário"

Cenário: DELETE Erro no Token 401
    [tags]      DELETE401.1
    Criar Sessao
    DELETE Endpoint "/carrinhos/concluir-compra" Token "Inválido"
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: DELETE Excluir Carrinho e Retornar Produtos ao Estoque 200
    [tags]      DELETE200.2
    Criar Sessao
    DELETE Endpoint "/carrinhos/cancelar-compra" Token "Válido"
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso | Não foi encontrado carrinho para esse usuário"

Cenário: DELETE Erro no Token 401
    [tags]      DELETE401.2
    Criar Sessao
    DELETE Endpoint "/carrinhos/cancelar-compra" Token "Expirado"
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"


#Área para desenvolver as keywords utilizadas nos casos de teste
* Keywords *

Criar Sessao
    Create Session          serverest       http://localhost:3000

DELETE Endpoint "${endpoint}" Token "${estado}"
    ${response}             DELETE On Session       serverest       ${endpoint}     expected_status=anything
    Set Global Variable     ${response}

Validar Status Code "${statuscode}"
    Should Be True          ${response.status_code} == ${statuscode}

Validar Mensagem: "${mensagem}"
    Should Match          ${response.json()["message"]}       ${mensagem}