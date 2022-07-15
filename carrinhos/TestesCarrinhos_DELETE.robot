# Esse arquivo contém os Test Cases que se referem ao DELETE do Endpoint /carrinhos
# Para montar esses Test Cases, foi utilizada a API ServeRest que pode ser encontrada em https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

# Área para definir as configurações do arquivo
* Settings *
Documentation   Arquivo simples para requisições DELETE no Endpoint /carrinhos
Library         RequestsLibrary
Resource        ../common.robot
Resource        ../login/keywordsLogin.robot

#Área para escrever os casos que serão testados
* Test Cases *

Cenário: DELETE Excluir Carrinho 200
    [tags]      DELETE200.1
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Endpoint "/carrinhos/concluir-compra"
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso | Não foi encontrado carrinho para esse usuário"

Cenário: DELETE Concluir Compra com Erro no Token 401
    [tags]      DELETE401.1
    Criar Sessao
    DELETE Endpoint "/carrinhos/concluir-compra" Sem Token
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: DELETE Excluir Carrinho e Retornar Produtos ao Estoque 200
    [tags]      DELETE200.2
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Endpoint "/carrinhos/cancelar-compra"
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso | Não foi encontrado carrinho para esse usuário"

Cenário: DELETE Cancelar Compra com Erro no Token 401
    [tags]      DELETE401.2
    Criar Sessao
    DELETE Endpoint "/carrinhos/cancelar-compra" Sem Token
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"


#Área para desenvolver as keywords utilizadas nos casos de teste
* Keywords *

DELETE Endpoint "${endpoint}"
    ${header}                   Create Dictionary       Authorization=${token_auth}
    ${response}                 DELETE On Session       serverest       ${endpoint}     expected_status=anything    headers=${header}
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

DELETE Endpoint "${endpoint}" Sem Token
    ${response}                 DELETE On Session       serverest       ${endpoint}      expected_status=anything
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}
