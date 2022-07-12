# Esse arquivo contém os Test Cases que se referem ao PUT do Endpoint /usuarios
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

# Área para definir as configurações do arquivo
* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs
Library         RequestsLibrary

# Área para setar as váriaveis do projeto
* Variables *


#Área para escrever os casos que serão testados
* Test Cases *

Cenário: PUT Editar Usuario Existente 200
    [tags]      PUT200
    Criar Sessao
    PUT Editar id "susXVV8VDdM3MOhW"
    Validar Status Code "200"
    Validar Mensagem: "Registro alterado com sucesso"

Cenário: PUT Cadastrar novo Usuario 201
    [tags]      PUT201
    Criar Sessao
    PUT Criar Usuário
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"

Cenário: PUT Mudar Email de um Usuário para um Existente 400
    [tags]      PUT400
    Criar Sessao
    PUT Editar id "0uxuPY0cbmQhpEz1" com Email Existente
    Validar Status Code "400"
    Validar Mensagem: "Este email já está sendo usado"


#Área para desenvolver as keywords utilizadas nos casos de teste
* Keywords *
Criar Sessao
    Create Session          serverest       http://localhost:3000

PUT Editar id "${id}"
    &{payload}              Create Dictionary   nome=Lizzie Grant   email=stargirlinterlude@gmail.com   password=ultraviolence     administrador=true
    ${response}             PUT On Session      serverest      /usuarios/${id}       data=&{payload}     json=None      expected_status=anything
    Log To Console          ${response.content}
    Set Global Variable     ${response}

PUT Criar Usuário
    &{payload}              Create Dictionary   nome=Taylor Swift   email=evermore@gmail.com   password=reputation     administrador=true
    ${response}             PUT On Session      serverest      /usuarios/0uxuPY0cbmQhpEz1       data=&{payload}     json=None      expected_status=anything
    Log To Console          ${response.content}
    Set Global Variable     ${response}

PUT Editar id "${id}" com Email Existente
    &{payload}              Create Dictionary   nome=Frank Ocean   email=stargirlinterlude@gmail.com   password=ivy     administrador=true
    ${response}             PUT On Session      serverest      /usuarios/${id}       data=&{payload}     json=None      expected_status=anything
    Log To Console          ${response.content}
    Set Global Variable     ${response}  

Validar Status Code "${statuscode}"
    Should Be True          ${response.status_code} == ${statuscode}

Validar Mensagem: "${mensagem}"
    Should Match            ${response.json()["message"]}       ${mensagem}