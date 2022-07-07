# Esse arquivo contém os Test Cases que se referem ao POST do Endpoint /produtos
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Test Cases *

Cenário: POST Cadastrar Novo Produto 201
    Criar Novo Produto Dinâmico
    POST Produto Dinâmico no Endpoint /produtos
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"

Cenário: POST Cadastrar Produto Existente 400
    POST Produto Dinâmico já Criado
    Validar Status Code "400"
    Validar Mensagem: "Já existe produto com esse nome"

Cenário: POST Erro no Token 401
    POST Produto com Token Inválido
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: POST Acesso Apenas ao Administrador 403
    POST Produto com Parametro Administrador
    Validar Status Code "403"
    Validar Mensagem: "Rota exclusiva para administradores"