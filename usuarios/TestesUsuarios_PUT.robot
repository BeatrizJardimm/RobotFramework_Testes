# Esse arquivo contém os Test Cases que se referem ao PUT do Endpoint /usuarios
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

# Área para definir as configurações do arquivo
* Settings *
Documentation   Arquivo simples para requisiçõesPUT no Endpoint /usuarios
Library         RequestsLibrary
Resource        ../common.robot

# Área para setar as váriaveis do projeto
* Variables *


#Área para escrever os casos que serão testados
* Test Cases *

Cenário: PUT Editar Usuario Existente 200
    [tags]      PUT200
    Criar Sessao
    Editar Usuario Valido
    Validar Status Code "200"
    Validar Mensagem: "Registro alterado com sucesso"

Cenário: PUT Cadastrar novo Usuario 201
    [tags]      PUT201
    Criar Sessao
    Criar Usuario Valido
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"

Cenário: PUT Mudar Email de um Usuário para um Existente 400
    [tags]      PUT400
    Criar Sessao
    Editar com Email Existente
    Validar Status Code "400"
    Validar Mensagem: "Este email já está sendo usado"


#Área para desenvolver as keywords utilizadas nos casos de teste
* Keywords *

Editar Usuario Valido
    ${json}                 Importar JSON Estatico      json_usuarios_ex.json
    ${payload}              Set Variable                ${json["usuario_editado"]}
    Set Global Variable     ${payload}
    PUT Editar id "susXVV8VDdM3MOhW"

Criar Usuario Valido
    ${json}                 Importar JSON Estatico      json_usuarios_ex.json
    ${payload}              Set Variable                ${json["usuario_nao_administrador"]}
    Set Global Variable     ${payload}
    PUT Criar Usuário
    
Editar com Email Existente
    ${json}                 Importar JSON Estatico      json_usuarios_ex.json
    ${payload}              Set Variable                ${json["usuario_invalido"]}
    Set Global Variable     ${payload}
    PUT Editar com Email Existente

PUT Editar id "${id}"
    ${response}             PUT On Session      serverest      /usuarios/${id}       json=&{payload}    expected_status=anything
    Printar Conteudo Response   ${response}
    Set Global Variable     ${response}

PUT Criar Usuário
    ${response}             PUT On Session      serverest      /usuarios/0uxuPY0cbmQhpEz1       json=&{payload}     expected_status=anything
    Printar Conteudo Response   ${response}
    Set Global Variable     ${response}

PUT Editar com Email Existente
    ${response}             PUT On Session      serverest      /usuarios/CNR4yVgA8tQfkvqv       json=&{payload} expected_status=anything
    Printar Conteudo Response   ${response}
    Set Global Variable     ${response}