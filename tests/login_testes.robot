# Área para definir as configurações do arquivo
* Settings *
Documentation       Arquivo para Test Cases no Endpoint /login
Resource            ../keywords/login_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *

#estou usando massa estática para fazer todos os testes de login

Cenario: POST Realizar Login 200
    [tags]  	login200
    Fazer Login     valido_sem_carrinho
    Validar Status Code "200"
    Validar Mensagem: "Login realizado com sucesso"

Cenario: POST Realizar Login sem Email 400
    [tags]      login400.1
    Fazer Login     sem_email
    Validar Status Code "400"
    Validar Response    email

Cenario: POST Realizar Login sem Senha 400
    [tags]      login400.2
    Fazer Login     sem_senha
    Validar Status Code "400"
    Validar Response    password

Cenario: POST Realizar Login com Email Invalido 401
    [tags]  	login401.1
    Fazer Login     email_invalido
    Validar Status Code "401"
    Validar Mensagem: "Email e/ou senha inválidos"

Cenario: POST Realizar Login com Senha Invalida 401
    [tags]  	login401.2
    Fazer Login     senha_invalida
    Validar Status Code "401"
    Validar Mensagem: "Email e/ou senha inválidos"