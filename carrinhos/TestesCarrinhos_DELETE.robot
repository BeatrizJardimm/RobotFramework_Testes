# Esse arquivo contém os Test Cases que se referem ao DELETE do Endpoint /carrinhos
# Para montar esses Test Cases, foi utilizada a API ServeRest que pode ser encontrada em https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs
Library         RequestsLibrary

* Variables *


* Test Cases *

Cenário: DELETE Excluir Carrinho 200
    Criar Sessao
    DELETE Endpoint "/carrinhos/concluir-compra" Token "Válido"
    Validar Status Code "200"
#    Validar Mensagem: "Registro excluído com sucesso | Não foi encontrado carrinho para esse usuário"

Cenário: DELETE Erro no Token 401
    Criar Sessao
    DELETE Endpoint "/carrinhos/concluir-compra" Token "Inválido"
    Validar Status Code "401"
#    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: DELETE Excluir Carrinho e Retornar Produtos ao Estoque 200
    Criar Sessao
    DELETE Endpoint "/carrinhos/cancelar-compra" Token "Válido"
    Validar Status Code "200"
#    Validar Mensagem: "Registro excluído com sucesso | Não foi encontrado carrinho para esse usuário"

Cenário: DELETE Erro no Token 401
    Criar Sessao
    DELETE Endpoint "/carrinhos/cancelar-compra" Token "Expirado"
    Validar Status Code "401"
#    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

* Keywords *

Criar Sessao
    Create Session          serverest       https://serverest.dev

DELETE Endpoint "${endpoint}" Token "${estado}"
    ${response}             DELETE On Session       serverest       ${endpoint}     expected_status=anything
    Set Global Variable     ${response}

Validar Status Code "${statuscode}"
    Should Be True          ${response.status_code} == ${statuscode}