# Área para definir as configurações do arquivo
* Settings *
Documentation       Arquivo para Test Cases no Endpoint /usuarios
Resource            ../keywords/usuarios_keywords.robot
Suite Setup         Criar Sessao

#Área para escrever os cenários de testes
* Test Cases *

# ----------------------- GET -----------------------
Cenário: GET Todos os Usuários 200
    [tags]      GET200.1
    GET Endpoint /usuarios
    Validar Status Code "200"

# usa dados estáticos
Cenário: GET Usuário Específico 200
    [tags]      GET200.2
    GET Endpoint /usuarios id "CNR4yVgA8tQfkvqv"
    Validar Status Code "200"
    Validar nome: "Taylor Swift"

Cenário: GET Usuário Inexistente 400
    [tags]      GET400
    GET Endpoint /usuarios id "Inexistente"
    Validar Status Code "400"
    Validar message: "Usuário não encontrado"


# ----------------------- POST -----------------------
Cenário: POST Cadastrar Novo Usuario 201
    [tags]      POST200
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar message: "Cadastro realizado com sucesso"
    DELETE Usuario id "${response.json()["_id"]}"
    Validar Status Code "200"

Cenário: POST Cadastrar Novo Usuário com Email Já Cadastrado 400
    [tags]      POST400.1
    Pega Usuario Estatico   invalido
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar message: "Este email já está sendo usado"

Cenário: POST Cadastrar Novo Usuário sem Email 400
    [tags]      POST400.2
    Pega Usuario Estatico   sem_email
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar email: "email não pode ficar em branco"

Cenário: POST Cadastrar Novo Usuário sem Senha 400
    [tags]      POST400.3
    Pega Usuario Estatico   sem_senha
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar password: "password não pode ficar em branco"


# ----------------------- PUT -----------------------
Cenário: PUT Editar Usuario Existente 200
    [tags]      PUT200
    Editar Dados Usuario Valido     stargirlinterlude@gmail.com
    PUT Editar id "susXVV8VDdM3MOhW"
    Validar Status Code "200"
    Validar message: "Registro alterado com sucesso"

Cenário: PUT Cadastrar novo Usuario 201
    [tags]      PUT201
    Criar Dados Usuario Valido
    PUT Criar Usuário
    Validar Status Code "201"
    Validar message: "Cadastro realizado com sucesso"
    DELETE Usuario id "${response.json()["_id"]}"
    Validar Status Code "200"

Cenário: PUT Mudar Email de um Usuário para um Existente 400
    [tags]      PUT400
    Pega Usuario Estatico   invalido
    PUT Editar com Email Existente
    Validar Status Code "400"
    Validar message: "Este email já está sendo usado"


# ----------------------- DELETE -----------------------
Cenário: DELETE Excluir Usuário Existente 200
    [tags]  	DELETE200.1
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    Validar Status Code "201"
    DELETE Usuario id "${response.json()["_id"]}" 
    Validar Status Code "200"
    Validar message: "Registro excluído com sucesso"

Cenário: DELETE Excluir Usuário Inexistente 200
    [tags]  	DELETE200.2
    DELETE Usuario id "Inexistente"
    Validar Status Code "200"
    Validar message: "Nenhum registro excluído"    

Cenário: DELETE Excluir Usuário com Carrinho Cadastrado 400
    [tags]  	DELETE400
    DELETE Usuario id "oUb7aGkMtSEPf6BZ"    #id de um user que tem carrinho cadastrado
    Validar Status Code "400"
    Validar message: "Não é permitido excluir usuário com carrinho cadastrado"