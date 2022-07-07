# Esse arquivo contém os Test Cases que se referem ao PUT do Endpoint /produtos
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Test Cases *

Cenário: PUT Editar Produto Existente 200
    PUT Editar Produto com id "/0uxuPY0cbmQhpEz1" Usando Dados Dinâmicos
    Validar Status Code "200"
    Validar Mensagem: "Registro alterado com sucesso"

Cenário: PUT Cadastrar Novo Produto 201
    Criar Novo Produto Dinâmico
    PUT Produto Dinâmico no Endpoint /produtos
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"

Cenário: PUT Editar Para Nome já Existente 400
    PUT Editar Produto com Nome já Utilizado
    Validar Status Code "400"
    Validar Mensagem: "Já existe produto com esse nome"

Cenário: PUT Erro no Token 401
    PUT Produto com Token Ausente
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: PUT Acesso Apenas ao Administrador 403
    PUT Produto com Parametro administrador
    Validar Status Code "403"
    Validar Mensagem: "Rota exclusiva para administradores"