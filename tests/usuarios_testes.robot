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
    ${usuarios}     Usuarios Sem Carrinhos
    Log To Console      Usuários que não têm carrinho cadastrado: ${usuarios}

# usa dados estáticos
Cenário: GET Usuário Específico 200
    [tags]      GET200.2
    GET Endpoint /usuarios id "CNR4yVgA8tQfkvqv"
    Validar nome: "Taylor Swift"
    Validar Status Code "200"

Cenário: GET Usuário Inexistente 400
    [tags]      GET400
    GET Endpoint /usuarios id "Inexistente"
    Validar message: "Usuário não encontrado"
    Validar Status Code "400"


# ----------------------- POST -----------------------
Cenário: POST Cadastrar Novo Usuario 201
    [tags]      POST200
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    Validar message: "Cadastro realizado com sucesso"
    Validar Status Code "201"
    DELETE Usuario id "${response.json()["_id"]}"

Cenário: POST Cadastrar Novo Usuário com Email Já Cadastrado 400
    [tags]      POST400.1
    Pega Usuario Estatico   invalido
    POST Endpoint /usuarios
    Validar message: "Este email já está sendo usado"
    Validar Status Code "400"

Cenário: POST Cadastrar Novo Usuário sem Email 400
    [tags]      POST400.2
    Pega Usuario Estatico   sem_email
    POST Endpoint /usuarios
    Validar email: "email não pode ficar em branco"
    Validar Status Code "400"

Cenário: POST Cadastrar Novo Usuário sem Senha 400
    [tags]      POST400.3
    Pega Usuario Estatico   sem_senha
    POST Endpoint /usuarios
    Validar password: "password não pode ficar em branco"
    Validar Status Code "400"


# ----------------------- PUT -----------------------
Cenário: PUT Editar Usuario Existente 200
    [tags]      PUT200
    Editar Dados Usuario Valido     stargirlinterlude@gmail.com
    PUT Editar id "susXVV8VDdM3MOhW"
    Validar message: "Registro alterado com sucesso"
    Validar Status Code "200"

Cenário: PUT Cadastrar novo Usuario 201
    [tags]      PUT201
    Criar Dados Usuario Valido
    PUT Criar Usuário
    Validar message: "Cadastro realizado com sucesso"
    Validar Status Code "201"
    DELETE Usuario id "${response.json()["_id"]}"

Cenário: PUT Mudar Email de um Usuário para um Existente 400
    [tags]      PUT400
    Pega Usuario Estatico   invalido
    PUT Editar com Email Existente
    Validar message: "Este email já está sendo usado"
    Validar Status Code "400"


# ----------------------- DELETE -----------------------
Cenário: DELETE Excluir Usuário Existente 200
    [tags]  	DELETE200.1
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    DELETE Usuario id "${response.json()["_id"]}" 
    Validar message: "Registro excluído com sucesso"
    Validar Status Code "200"

Cenário: DELETE Excluir Usuário Inexistente 200
    [tags]  	DELETE200.2
    DELETE Usuario id "Inexistente"
    Validar message: "Nenhum registro excluído"
    Validar Status Code "200"    

Cenário: DELETE Excluir Usuário com Carrinho Cadastrado 400
    [tags]  	DELETE400
    DELETE Usuario id "oUb7aGkMtSEPf6BZ"    #id de um user que tem carrinho cadastrado
    Validar message: "Não é permitido excluir usuário com carrinho cadastrado"
    Validar Status Code "400"