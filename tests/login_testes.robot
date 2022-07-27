# Área para definir as configurações do arquivo
* Settings *
Documentation       Arquivo para Test Cases no Endpoint /login
Resource            ../keywords/login_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *

#estou usando massa estática para fazer todos os testes de login

Cenario: POST Realizar Login 200
    [tags]  	LOGIN200
    Fazer Login     valido_sem_carrinho
    Validar message: "Login realizado com sucesso"
    Validar Status Code "200"

Cenario: POST Realizar Login sem Email 400
    [tags]      LOGIN400.1
    Fazer Login     sem_email
    Validar email: "email não pode ficar em branco"   
    Validar Status Code "400"

Cenario: POST Realizar Login sem Senha 400
    [tags]      LOGIN400.2
    Fazer Login     sem_senha
    Validar password: "password não pode ficar em branco"
    Validar Status Code "400"

Cenario: POST Realizar Login com Email Invalido 401
    [tags]  	LOGIN401.1
    Fazer Login     email_invalido
    Validar message: "Email e/ou senha inválidos"
    Validar Status Code "401"

Cenario: POST Realizar Login com Senha Invalida 401
    [tags]  	LOGIN401.2
    Fazer Login     senha_invalida
    Validar message: "Email e/ou senha inválidos"
    Validar Status Code "401"