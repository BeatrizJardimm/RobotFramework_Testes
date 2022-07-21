# Área para definir as configurações do arquivo
* Settings *
Documentation       Arquivo para Test Cases no Endpoint /produtos
Resource            ../keywords/produtos_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *

Cenário: GET Todos os Produtos 200
    [tags]      GET200.1
    GET Endpoint /produtos
    Validar Status Code "200"

Cenário: GET Produto Específico 200
    [tags]      GET200.2
    GET Endpoint /produtos id "BeeJh5lz3k6kSIzA"
    Validar Status Code "200"
    Validar Nome: "Logitech MX Vertical"

Cenário: GET Produto Inexistente 400
    [tags]      GET400
    GET Endpoint /produtos id "Inexistente"
    Validar Status Code "400"
    Validar Mensagem: "Produto não encontrado"

Cenário: POST Cadastrar Novo Produto 201
    [tags]      POST201
    Fazer Login e Armazenar Token
    Criar Dados Produto Valido
    POST Endpoint /produtos
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"
    DELETE id "${response.json()["_id"]}"
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso"

Cenário: POST Cadastrar Produto Existente 400
    [tags]      POST400.1
    Fazer Login e Armazenar Token
    Pega Produto Estatico   invalido
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Mensagem: "Já existe produto com esse nome"

Cenário: POST Cadastrar Produto sem Nome 400
    [tags]      POST400.2
    Fazer Login e Armazenar Token
    Pega Produto Estatico   sem_nome
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Response        nome

#passando uma string como parametro de preço que deve receber um inteiro
Cenário: POST Cadastrar Produto com Preço Invalido 400
    [tags]      POST400.3
    Fazer Login e Armazenar Token
    Pega Produto Estatico   preco_invalido
    POST Endpoint /produtos
    Validar Status Code "400"

Cenário: POST Erro no Token 401
    [tags]      POST401.1
    Pega Produto Estatico   valido
    POST Endpoint /produtos
    POST Sem Token
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: PUT Editar Produto Existente 200
    [tags]      PUT200
    Fazer Login e Armazenar Token
    Editar Dados Produto Valido     Logitech MX Vertical
    PUT id "BeeJh5lz3k6kSIzA"
    Validar Status Code "200"
    Validar Mensagem: "Registro alterado com sucesso"

Cenário: PUT Cadastrar Novo Produto 201
    [tags]      PUT201
    Fazer Login e Armazenar Token
    Criar Dados Produto Valido
    PUT Novo Produto
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"
    DELETE id "${response.json()["_id"]}"
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso"

Cenário: PUT Editar Para Nome já Existente 400
    [tags]  	PUT400
    Fazer Login e Armazenar Token
    Pega Produto Estatico   editado
    PUT id "K6leHdftCeOJj8BJ"
    Validar Status Code "400"
    Validar Mensagem: "Já existe produto com esse nome"

Cenário: PUT Erro no Token 401
    [tags]      PUT401
    PUT Sem Token
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: DELETE Excluir Produto Específico 200
    [tags]      DELETE200.1
    Fazer Login e Armazenar Token
    Criar Dados Produto Valido
    POST Endpoint /produtos
    DELETE id "${response.json()["_id"]}"
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso"

Cenário: DELETE Excluir Produto Inexistente 200
    [tags]      DELETE200.2
    Fazer Login e Armazenar Token
    DELETE id "Inexistente"
    Validar Status Code "200"
    Validar Mensagem: "Nenhum registro excluído"

Cenário: DELETE Excluir Produto que está no Carrinho 400
    [tags]      DELETE400
    Fazer Login e Armazenar Token
    DELETE id "BeeJh5lz3k6kSIzA"        # o produto que contém essa id está em um carrinho
    Validar Status Code "400"
    Validar Mensagem: "Não é permitido excluir produto que faz parte de carrinho"

Cenário: DELETE Erro no Token 401
    [tags]      DELETE401
    DELETE Sem Token
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: DELETE Acesso Apenas ao Administrador 403
    [tags]      DELETE403
    Fazer Login Sem Admnistrador e Armazenar Token
    DELETE id "0uxuPY0cbmQhpEz1"
    Validar Status Code "403"
    Validar Mensagem: "Rota exclusiva para administradores"