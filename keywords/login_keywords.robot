* Settings *
Documentation   Arquivo para as Keywords do Endpoint /login
Resource        ../support/base.robot

* Keywords *

POST Endpoint /login
    ${response}                 POST On Session       serverest      /login      json=&{payload}    expected_status=anything
    Printar Conteudo Response   ${response}
    Set Global Variable         ${response}

Fazer Login com Usuário Válido de Massa Estatica
    ${json}                     Importar JSON Estatico              json_login_ex.json
    ${payload}                  Set Variable                        ${json["login_valido_sem_carrinho"]}
    Set Global Variable         ${payload}
    POST Endpoint /login

Fazer Login com Email Invalido de Massa Estatica
    ${json}                     Importar JSON Estatico              json_login_ex.json
    ${payload}                  Set Variable                        ${json["login_email_invalido"]}
    Set Global Variable         ${payload}
    POST Endpoint /login

Fazer Login com Senha Invalida de Massa Estatica
    ${json}                     Importar JSON Estatico              json_login_ex.json
    ${payload}                  Set Variable                        ${json["login_senha_invalida"]}
    Set Global Variable         ${payload}
    POST Endpoint /login

Fazer Login sem Email
    ${json}                     Importar JSON Estatico              json_login_ex.json
    ${payload}                  Set Variable                        ${json["login_sem_email"]}
    Set Global Variable         ${payload}
    POST Endpoint /login

Fazer Login sem Senha
    ${json}                     Importar JSON Estatico              json_login_ex.json
    ${payload}                  Set Variable                        ${json["login_sem_senha"]}
    Set Global Variable         ${payload}
    POST Endpoint /login

Fazer Login com Usuário Válido Nao Administrador de Massa Estatica
    ${json}                     Importar JSON Estatico              json_login_ex.json
    ${payload}                  Set Variable                        ${json["login_nao_administrador"]}
    Set Global Variable         ${payload}
    POST Endpoint /login

Validar Ter Logado
    Should Be Equal             ${response.json()["message"]}       Login realizado com sucesso
    Should Not Be Empty         ${response.json()["authorization"]}

Fazer Login e Armazenar Token
    Fazer Login com Usuário Válido de Massa Estatica
    Validar Ter Logado
    ${token_auth}               Set Variable                        ${response.json()["authorization"]}
    Set Global Variable         ${token_auth}

Fazer Login Sem Admnistrador e Armazenar Token
    Fazer Login com Usuário Válido Nao Administrador de Massa Estatica
    Validar Ter Logado
    ${token_auth}               Set Variable                        ${response.json()["authorization"]}
    Set Global Variable         ${token_auth}