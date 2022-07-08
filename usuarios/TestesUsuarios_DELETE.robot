# Esse arquivo contém os Test Cases que se referem ao DELETE do Endpoint /usuarios
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs
Library         RequestsLibrary

* Variables *


* Test Cases *

# passar a id de um usuário que não tem carrinho cadastrado
Cenário: DELETE Excluir Usuário Existente 200
    Criar Sessao
    DELETE Usuario id "7MeFns1sLIuGyBHA" 
    Validar Status Code "200"
#    Validar Mensagem: "Registro excluído com sucesso | Nenhum registro excluído"

# passar a id de um usuário que tenha carrinho cadastrado
Cenário: DELETE Excluir Usuário com Carrinho Cadastrado 400
    Criar Sessao
    DELETE Usuario id "oUb7aGkMtSEPf6BZ"
    Validar Status Code "400"
#    Validar Mensagem: "Não é permitido excluir usuário com carrinho cadastrado"

* Keywords *
Criar Sessao
    Create Session          serverest       https://serverest.dev

DELETE Usuario id "${id}"
    ${response}             DELETE On Session     serverest       /usuarios/${id}      expected_status=anything
    Set Global Variable     ${response}

Validar Status Code "${statuscode}"
    Should Be True          ${response.status_code} == ${statuscode}