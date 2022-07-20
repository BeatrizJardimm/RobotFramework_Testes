# Área para definir as configurações do arquivo
* Settings *
Documentation   Arquivo para Test Cases no Endpoint /usuarios
Resource        ../keywords/usuarios_keywords.robot

* Variables *
${id_user_existente}                 QrfK3NGEg3gATntD
${id_user_inexistente}               5je0IQ0AEwLCgBu7
${id_user_com_carrinho}              oUb7aGkMtSEPf6BZ

#Área para escrever os cenários de testes
* Test Cases *

Cenário: GET Todos os Usuários 200
    [tags]      GET200.1
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"

# usa dados estáticos
Cenário: GET Usuário Específico 200
    [tags]      GET200.2
    Criar Sessao
    GET Endpoint /usuarios id "CNR4yVgA8tQfkvqv"
    Validar Status Code "200"
    Validar Nome: "Taylor Swift"

Cenário: GET Usuário Inexistente 400
    [tags]      GET400
    Criar Sessao
    GET Endpoint /usuarios id "Inexistente"
    Validar Status Code "400"
    Validar Mensagem: "Usuário não encontrado"

Cenário: POST Cadastrar Novo Usuario 201
    [tags]      POST200
    Criar Sessao
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"
    DELETE Usuario id "${response.json()["_id"]}"
    Validar Status Code "200"

Cenário: POST Cadastrar Novo Usuário com Email Já Cadastrado 400
    [tags]      POST400.1
    Criar Sessao
    Criar Usuario Estatico Invalido
    Validar Status Code "400"
    Validar Mensagem: "Este email já está sendo usado"

Cenário: POST Cadastrar Novo Usuário sem Email 400
    [tags]      POST400.2
    Criar Sessao
    Criar Usuario Estatico sem Email
    Validar Status Code "400"
    Validar Response        email

Cenário: POST Cadastrar Novo Usuário sem Senha 400
    [tags]      POST400.3
    Criar Sessao
    Criar Usuario Estatico sem Senha
    Validar Status Code "400"
    Validar Response       password

Cenário: PUT Editar Usuario Existente 200
    [tags]      PUT200
    Criar Sessao
    Editar Dados Usuario Valido     stargirlinterlude@gmail.com
    PUT Editar id "susXVV8VDdM3MOhW"
    Validar Status Code "200"
    Validar Mensagem: "Registro alterado com sucesso"

Cenário: PUT Cadastrar novo Usuario 201
    [tags]      PUT201
    Criar Sessao
    Criar Dados Usuario Valido
    PUT Criar Usuário
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"
    DELETE Usuario id "${response.json()["_id"]}"
    Validar Status Code "200"

Cenário: PUT Mudar Email de um Usuário para um Existente 400
    [tags]      PUT400
    Criar Sessao
    Editar com Email Existente
    Validar Status Code "400"
    Validar Mensagem: "Este email já está sendo usado"

# passar a id de um usuário que não tem carrinho cadastrado
########## CRIAR UM USUARIO DENTRO DO TEST CASE E JA EXCLUIR ELE
Cenário: DELETE Excluir Usuário Existente 200
    [tags]  	DELETE200.1
    Criar Sessao
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    Validar Status Code "201"
    DELETE Usuario id "${response.json()["_id"]}" 
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso"

Cenário: DELETE Excluir Usuário Inexistente 200
    [tags]  	DELETE200.2
    Criar Sessao
    DELETE Usuario id "Inexistente"
    Validar Status Code "200"
    Validar Mensagem: "Nenhum registro excluído"    

Cenário: DELETE Excluir Usuário com Carrinho Cadastrado 400
    [tags]  	DELETE400
    Criar Sessao
    DELETE Usuario id "${id_user_com_carrinho}"
    Validar Status Code "400"
    Validar Mensagem: "Não é permitido excluir usuário com carrinho cadastrado"