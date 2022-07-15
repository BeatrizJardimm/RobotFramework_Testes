# Esse arquivo contém os Test Cases que se referem ao POST do Endpoint /usuarios
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

# Área para definir as configurações do arquivo
* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs
Library         RequestsLibrary
Resource        ../common.robot

# Área para setar as váriaveis do projeto
* Variables *


#Área para escrever os casos que serão testados
* Test Cases *

Cenário: POST Cadastrar Novo Usuario 201
    [tags]      POST200
    Criar Sessao
    Criar Usuario Estatico Valido
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"

Cenário: POST Cadastrar Novo Usuário com Email Já Cadastrado 400
    [tags]      POST400
    Criar Sessao
    Criar Usuario Estatico Invalido
    Validar Status Code "400"
    Validar Mensagem: "Este email já está sendo usado"

#Área para desenvolver as keywords utilizadas nos casos de teste
* Keywords *
POST Endpoint /usuarios
    ${response}             POST On Session     serverest       /usuarios       json=&{payload}     expected_status=anything
    Printar Conteudo Response   ${response}
    Set Global Variable     ${response}

Criar Usuario Estatico Valido
    ${json}                 Importar JSON Estatico      json_usuarios_ex.json
    ${payload}              Set Variable                ${json["usuario_valido"]}
    Set Global Variable     ${payload}
    POST Endpoint /usuarios

Criar Usuario Estatico Invalido
    ${json}                 Importar JSON Estatico      json_usuarios_ex.json
    ${payload}              Set Variable                ${json["usuario_invalido"]}
    Set Global Variable     ${payload}
    POST Endpoint /usuarios