# Esse arquivo contém os Test Cases que se referem ao DELETE do Endpoint /usuarios
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

# passar a id de um usuário que não tem carrinho cadastrado
Cenário: DELETE Excluir Usuário Existente 200
    [tags]  	DELETE200.1
    Criar Sessao
    DELETE Usuario id "0uxuPY0cbmQhpEz1" 
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso"

# passar a id de um usuário que não existe
Cenário: DELETE Excluir Usuário Inexistente 200
    [tags]  	DELETE200.2
    Criar Sessao
    DELETE Usuario id "5je0IQ0AEwLCgBu7" 
    Validar Status Code "200"
    Validar Mensagem: "Nenhum registro excluído"    

# passar a id de um usuário que tenha carrinho cadastrado
Cenário: DELETE Excluir Usuário com Carrinho Cadastrado 400
    [tags]  	DELETE400
    Criar Sessao
    DELETE Usuario id "oUb7aGkMtSEPf6BZ"
    Validar Status Code "400"
    Validar Mensagem: "Não é permitido excluir usuário com carrinho cadastrado"

#Área para desenvolver as keywords utilizadas nos casos de teste
* Keywords *
Criar Sessao
    Create Session          serverest       http://localhost:3000

DELETE Usuario id "${id}"
    ${response}             DELETE On Session     serverest       /usuarios/${id}      expected_status=anything
    Set Global Variable     ${response}

Validar Status Code "${statuscode}"
    Should Be True          ${response.status_code} == ${statuscode}

Validar Mensagem: "${mensagem}"
    Should Match          ${response.json()["message"]}       ${mensagem}