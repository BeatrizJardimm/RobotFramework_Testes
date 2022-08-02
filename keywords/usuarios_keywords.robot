# Área para definir as configurações do arquivo
* Settings *
Documentation   Arquivo para as Keywords do Endpoint /usuarios
Resource        ../support/base.robot

#Área para desenvolver as keywords utilizadas nos casos de teste
* Keywords *

Pega Usuario Estatico
    [Arguments]                     ${estado}
    ${json}                         Importar JSON Estatico      json_usuarios_ex.json
    ${payload}                      Set Variable                ${json["usuario_${estado}"]}
    Set Global Variable             ${payload}


# ----------------------- GET -----------------------
GET Endpoint /usuarios
    ${response}                     GET On Session     serverest       /usuarios
    Log To Console                  \n\n${response.content}
    Set Global Variable             ${response}

GET Endpoint /usuarios id "${id}"
    ${response}                     GET On Session     serverest       /usuarios/${id}                  expected_status=anything
    Log To Console                  \n\n${response.content}
    Set Global Variable             ${response}


# ----------------------- POST -----------------------
POST Endpoint /usuarios
    ${response}                     POST On Session     serverest       /usuarios                       json=&{payload}     expected_status=anything
    Set Global Variable             ${response}


# ----------------------- PUT -----------------------
PUT Editar id "${id}"
    ${response}                     PUT On Session      serverest       /usuarios/${id}                 json=&{payload}    expected_status=anything
    Set Global Variable             ${response}

PUT Criar Usuário
    ${response}                 PUT On Session          serverest      /usuarios/idNaoEncontrada        json=&{payload}     expected_status=anything
    Set Global Variable         ${response}

PUT Editar com Email Existente
    ${response}                 PUT On Session          serverest      /usuarios/CNR4yVgA8tQfkvqv       json=&{payload}      expected_status=anything
    Set Global Variable         ${response}


# ----------------------- DELETE -----------------------
DELETE Usuario id "${id}"
    ${response}                 DELETE On Session       serverest       /usuarios/${id}                 expected_status=anything
    Set Global Variable         ${response}