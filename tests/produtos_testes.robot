# Área para definir as configurações do arquivo
* Settings *
Documentation       Arquivo para Test Cases no Endpoint /produtos
Resource            ../keywords/produtos_keywords.robot
Resource            ../keywords/usuarios_keywords.robot
Resource            ../keywords/login_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *

# ----------------------- GET -----------------------
Cenário: GET Todos os Produtos 200
    [tags]      GET200.1
    GET Endpoint /produtos
    Validar Status Code "200"

Cenário: GET Produto Específico 200
    [tags]      GET200.2
    GET Endpoint /produtos id "BeeJh5lz3k6kSIzA"
    Validar nome: "Logitech MX Vertical"
    Validar Status Code "200"

Cenário: GET Produto Inexistente 400
    [tags]      GET400
    GET Endpoint /produtos id "Inexistente"
    Validar message: "Produto não encontrado"
    Validar Status Code "400"


# ----------------------- POST -----------------------
Cenário: POST Cadastrar Novo Produto 201
    [tags]      POST201
    Fazer Login e Armazenar Token
    Criar Dados Produto Valido
    POST Endpoint /produtos
    Validar message: "Cadastro realizado com sucesso"
    Validar Status Code "201"
    DELETE id "${response.json()["_id"]}"

Cenário: POST Cadastrar Produto Existente 400
    [tags]      POST400.1
    Fazer Login e Armazenar Token
    Pega Produto Estatico   invalido
    POST Endpoint /produtos
    Validar message: "Já existe produto com esse nome"
    Validar Status Code "400"

Cenário: POST Cadastrar Produto sem Nome 400
    [tags]      POST400.2
    Fazer Login e Armazenar Token
    Pega Produto Estatico   sem_nome
    POST Endpoint /produtos
    Validar nome: "nome não pode ficar em branco"
    Validar Status Code "400"

#passando uma string como parametro de preço que deve receber um inteiro
Cenário: POST Cadastrar Produto com Preço Invalido 400
    [tags]      POST400.3
    Fazer Login e Armazenar Token
    Pega Produto Estatico   preco_invalido
    POST Endpoint /produtos
    Validar preco: "preco deve ser um número"
    Validar Status Code "400"

Cenário: POST Sem Token 401
    [tags]      POST401.1
    Pega Produto Estatico   valido
    POST Sem Token
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: POST Token Invalido 401
    [tags]      POST401.2
    Pega Produto Estatico   valido
    POST Token Invalido
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: POST Token de Usuario Que Não Existe Mais 401
    [tags]      POST401.3
    Pega Usuario Estatico   teste_produto
    POST Endpoint /usuarios
    ${idUsuario}        Set Variable      ${response.json()["_id"]}
    Fazer Login e Armazenar Token   teste_produtos
    DELETE Usuario id "${idUsuario}"
    Pega Produto Estatico   valido
    POST Endpoint /produtos
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: POST Acesso Apenas ao Administrador 403
    [tags]      POST403
    Fazer Login Sem Admnistrador e Armazenar Token
    Criar Dados Produto Valido
    POST Endpoint /produtos
    Validar message: "Rota exclusiva para administradores"
    Validar Status Code "403"


# ----------------------- PUT -----------------------
Cenário: PUT Editar Produto Existente 200
    [tags]      PUT200
    Fazer Login e Armazenar Token
    Editar Dados Produto Valido     Logitech MX Vertical
    PUT id "BeeJh5lz3k6kSIzA"
    Validar message: "Registro alterado com sucesso"
    Validar Status Code "200"

Cenário: PUT Cadastrar Novo Produto 201
    [tags]      PUT201
    Fazer Login e Armazenar Token
    Criar Dados Produto Valido
    PUT Novo Produto
    Validar message: "Cadastro realizado com sucesso"
    Validar Status Code "201"
    DELETE id "${response.json()["_id"]}"

Cenário: PUT Editar Para Nome já Existente 400
    [tags]  	PUT400
    Fazer Login e Armazenar Token
    Pega Produto Estatico   editado
    PUT id "K6leHdftCeOJj8BJ"
    Validar message: "Já existe produto com esse nome"
    Validar Status Code "400"

Cenário: PUT Token Ausente 401
    [tags]      PUT401.1
    PUT Sem Token
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: PUT Token Invalido 401
    [tags]      PUT401.2
    PUT Token Invalido
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: PUT Token de Usuario Que Não Existe Mais 401
    [tags]      PUT401.3
    Pega Usuario Estatico   teste_produto
    POST Endpoint /usuarios
    ${idUsuario}        Set Variable      ${response.json()["_id"]}
    Fazer Login e Armazenar Token   teste_produtos
    DELETE Usuario id "${idUsuario}"
    Editar Dados Produto Valido     Logitech MX Vertical
    PUT id "BeeJh5lz3k6kSIzA"
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: PUT Acesso Apenas ao Administrador 403
    [tags]      PUT403
    Fazer Login Sem Admnistrador e Armazenar Token
    Editar Dados Produto Valido     Logitech MX Vertical
    PUT id "BeeJh5lz3k6kSIzA"
    Validar message: "Rota exclusiva para administradores"
    Validar Status Code "403"


# ----------------------- DELETE -----------------------
Cenário: DELETE Excluir Produto Específico 200
    [tags]      DELETE200.1
    Fazer Login e Armazenar Token
    Criar Dados Produto Valido
    POST Endpoint /produtos
    DELETE id "${response.json()["_id"]}"
    Validar message: "Registro excluído com sucesso"
    Validar Status Code "200"

Cenário: DELETE Excluir Produto Inexistente 200
    [tags]      DELETE200.2
    Fazer Login e Armazenar Token
    DELETE id "Inexistente"
    Validar message: "Nenhum registro excluído"
    Validar Status Code "200"

Cenário: DELETE Excluir Produto que está no Carrinho 400
    [tags]      DELETE400
    Fazer Login e Armazenar Token
    DELETE id "BeeJh5lz3k6kSIzA"        # o produto que contém essa id está em um carrinho
    Validar message: "Não é permitido excluir produto que faz parte de carrinho"
    Validar Status Code "400"

Cenário: DELETE Token Ausente 401
    [tags]      DELETE401.1
    DELETE Sem Token
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: DELETE Token Inválido 401
    [tags]      DELETE401.2
    DELETE Token Invalido
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: DELETE Token de Usuario Que Não Existe Mais 401
    [tags]      DELETE401.3
    Pega Usuario Estatico   teste_produto
    POST Endpoint /usuarios
    ${idUsuario}        Set Variable      ${response.json()["_id"]}
    Fazer Login e Armazenar Token   teste_produtos
    DELETE Usuario id "${idUsuario}"
    DELETE id "Inexistente"
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: DELETE Acesso Apenas ao Administrador 403
    [tags]      DELETE403
    Fazer Login Sem Admnistrador e Armazenar Token
    DELETE id "0uxuPY0cbmQhpEz1"
    Validar message: "Rota exclusiva para administradores"
    Validar Status Code "403"