# Área para definir as configurações do arquivo
* Settings *
Documentation   Arquivo para Test Cases no Endpoint /login
Resource        ../keywords/login_keywords.robot

* Test Cases *

Cenario: POST Realizar Login 200
    [tags]  	login200
    Criar Sessao
    Fazer Login com Usuário Válido de Massa Estatica
    Validar Status Code "200"
    Validar Mensagem: "Login realizado com sucesso"

Cenario: POST Realizar Login com Email Invalido 401
    [tags]  	login401.1
    Criar Sessao
    Fazer Login com Email Invalido de Massa Estatica
    Validar Status Code "401"
    Validar Mensagem: "Email e/ou senha inválidos"

Cenario: POST Realizar Login com Senha Invalida 401
    [tags]  	login401.2
    Criar Sessao
    Fazer Login com Email Invalido de Massa Estatica
    Validar Status Code "401"
    Validar Mensagem: "Email e/ou senha inválidos"