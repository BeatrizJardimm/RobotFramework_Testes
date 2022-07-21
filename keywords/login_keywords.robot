* Settings *
Documentation   Arquivo para as Keywords do Endpoint /login
Resource        ../support/base.robot

* Keywords *

Fazer Login
    [Arguments]                 ${estado}
    ${json}                     Importar JSON Estatico              json_login_ex.json
    ${payload}                  Set Variable                        ${json["login_${estado}"]}
    Set Global Variable         ${payload}
    POST Endpoint /login

Fazer Login e Armazenar Token
    Fazer Login     valido_sem_carrinho
    Validar Ter Logado
    ${token_auth}               Set Variable                        ${response.json()["authorization"]}
    Set Global Variable         ${token_auth}

Fazer Login Sem Admnistrador e Armazenar Token
    Fazer Login     nao_administrador
    Validar Ter Logado
    ${token_auth}               Set Variable                        ${response.json()["authorization"]}
    Set Global Variable         ${token_auth}

Validar Ter Logado
    Should Be Equal             ${response.json()["message"]}       Login realizado com sucesso
    Should Not Be Empty         ${response.json()["authorization"]}

POST Endpoint /login
    ${response}                 POST On Session       serverest      /login      json=&{payload}    expected_status=anything
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}