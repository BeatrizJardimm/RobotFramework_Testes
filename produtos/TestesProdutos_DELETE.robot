# Esse arquivo contém os Test Cases que se referem ao DELETE do Endpoint /produtos
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Settings *
Documentation   Arquivo simples para requisições DELETE no Endpoint /produtos
Library         RequestsLibrary
Resource        ../common.robot
Resource        ../login/keywordsLogin.robot

* Test Cases *

#rodar com um token válido
Cenário: DELETE Excluir Produto Específico 200
    [tags]      DELETE200
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE id "0uxuPY0cbmQhpEz1"        # não existe produto com essa id
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso | Nenhum registro excluído"

#rodar com um token válido
Cenário: DELETE Excluir Produto que está no Carrinho 400
    [tags]      DELETE400
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE id "BeeJh5lz3k6kSIzA"        # o produto que contém essa id está em um carrinho
    Validar Status Code "400"
    Validar Mensagem: "Não é permitido excluir produto que faz parte de carrinho"

#tentar excluir um produto sem token
Cenário: DELETE Erro no Token 401
    [tags]      DELETE401
    Criar Sessao
    DELETE Sem Token
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

#rodar com um token válido, porém com um usuário que não seja administrador
Cenário: DELETE Acesso Apenas ao Administrador 403
    [tags]      DELETE403
    Criar Sessao
    Fazer Login Sem Admnistrador e Armazenar Token
    DELETE id "0uxuPY0cbmQhpEz1"
    Validar Status Code "403"
    Validar Mensagem: "Rota exclusiva para administradores"

* Keywords *

DELETE id "${id}"
    ${header}                   Create Dictionary     Authorization=${token_auth}
    ${response}                 DELETE On Session     serverest       /produtos/${id}      expected_status=anything    headers=${header}
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

DELETE Sem Token
    ${response}                 DELETE On Session     serverest       /produtos/0uxuPY0cbmQhpEz1      expected_status=anything
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}