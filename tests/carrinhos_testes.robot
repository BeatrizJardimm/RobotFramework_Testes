# Área para definir as configurações do arquivo
* Settings *
Documentation       Arquivo para Test Cases no Endpoint /carrinhos
Resource            ../keywords/carrinhos_keywords.robot
Resource            ../keywords/usuarios_keywords.robot
Resource            ../keywords/login_keywords.robot
Suite Setup         Criar Sessao

#Área para escrever os casos que serão testados
* Test Cases *

# ----------------------- GET -----------------------
Cenário: GET Todos os Carrinhos 200
    [tags]      GET200.1
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenário: GET Carrinho Específico 200                  ############# USANDO LIB PYTHON
    [tags]      GET200.2
    GET Endpoint /carrinhos id "/qbMqntef4iTOwWfg"
    Validar _id: "qbMqntef4iTOwWfg"
    Validar Status Code "200"
    ${idCarrinho}        Set Variable                ${response.json()["_id"]}
    ${usuario}           Usuario Dono Carrinho       ${idCarrinho}
    Log To Console       Nome do usuário dono deste carrinho: ${usuario}

Cenário: GET Carrinho Inexistente 400
    [tags]      GET400
    GET Endpoint /carrinhos id "Inexistente"
    Validar message: "Carrinho não encontrado"
    Validar Status Code "400"


# ----------------------- POST -----------------------
Cenário: POST Cadastrar Carrinho 201                    ############# USANDO LIB PYTHON
    [tags]      POST201
    Fazer Login e Armazenar Token   valido_sem_carrinho
    Pega Carrinho Estatico          carrinho1
    POST Endpoint /carrinhos
    ${idCarrinho}                   Set Variable                ${response.json()["_id"]}
    ${usuario}                      Usuario Dono Carrinho       ${idCarrinho}
    Log To Console                  Nome do usuário dono deste carrinho: ${usuario}
    Validar message: "Cadastro realizado com sucesso"
    Validar Status Code "201"
    DELETE Endpoint "/carrinhos/cancelar-compra"

Cenário: POST Cadastrar 2 Carrinhos Para o Mesmo Usuário 400
    [tags]      POST400.1
    Fazer Login e Armazenar Token       valido_sem_carrinho       
    Pega Carrinho Estatico              carrinho1
    POST Endpoint /carrinhos
    Pega Carrinho Estatico              carrinho2
    POST Endpoint /carrinhos
    Validar message: "Não é permitido ter mais de 1 carrinho"
    Validar Status Code "400"
    DELETE Endpoint "/carrinhos/cancelar-compra"

Cenário: POST Cadastar um Carrinho Vazio 400
    [tags]      POST400.2
    Fazer Login e Armazenar Token   valido_sem_carrinho
    Pega Carrinho Estatico          carrinho3
    POST Endpoint /carrinhos
    Validar produtos: "produtos não contém 1 valor obrigatório"
    Validar Status Code "400"

Cenário: POST Cadastrar Carrinho com Produto Inexistente 400
    [tags]      POST400.3
    Fazer Login e Armazenar Token   valido_sem_carrinho
    Pega Carrinho Estatico          carrinho4
    POST Endpoint /carrinhos
    Validar message: "Produto não encontrado"
    Validar Status Code "400"

Cenário: POST Cadastrar Carrinho com Quantidade Indisponível de Produtos 400
    [tags]      POST400.4
    Fazer Login e Armazenar Token   valido_sem_carrinho
    Pega Carrinho Estatico          carrinho5
    POST Endpoint /carrinhos
    Validar message: "Produto não possui quantidade suficiente"
    Validar Status Code "400"

Cenário: POST Cadastrar Carrinho com Produto Duplicado 400
    [tags]      POST400.5
    Fazer Login e Armazenar Token   valido_sem_carrinho
    Pega Carrinho Estatico          carrinho6
    POST Endpoint /carrinhos
    Validar message: "Não é permitido possuir produto duplicado"
    Validar Status Code "400"

Cenário: POST Token Ausente 401
    [tags]      POST401
    Pega Carrinho Estatico      carrinho2
    POST Carrinho Sem Token
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: POST Token Inválido 401
    [tags]      POST401.2
    Pega Carrinho Estatico      carrinho1
    POST Carrinho Token Invalido
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: POST Token de Usuario Que Não Existe Mais 401
    [tags]      POST401.3
    Pega Usuario Estatico           teste_produto
    POST Endpoint /usuarios
    ${idUsuario}                    Set Variable      ${response.json()["_id"]}
    Fazer Login e Armazenar Token   teste_produtos
    DELETE Usuario id "${idUsuario}"
    Pega Carrinho Estatico          carrinho1
    POST Endpoint /carrinhos
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"


# A ideia de gerar um token e setar ele como variável fixa para ser usado até dias depois para validarmos o
# teste seguinte foi da minha colega Amanda, o perfil do GitHub dela está no arquivo README desse projeto
Cenário: POST Token Expirado 401
    [tags]      POST401.4
    Pega Carrinho Estatico      carrinho1
    POST Carrinho Token Expirado
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

# ----------------------- DELETE -----------------------
Cenário: DELETE Concluir Compra e Excluir Carrinho 200
    [tags]      DELETE200.1
    Fazer Login e Armazenar Token                       valido_sem_carrinho
    Quantidade Inicial de Produtos no Estoque           carrinho1
    Pega Carrinho Estatico                              carrinho1
    POST Endpoint /carrinhos
    Validar Quantidade de Produtos no Estoque           carrinho1
    DELETE Endpoint "/carrinhos/concluir-compra"
    Validar message: "Registro excluído com sucesso"
    Validar Status Code "200"
    Validar se Produtos Foram Retornados ao Estoque     carrinho1

Cenário: DELETE Concluir Compra de Usuário Sem Carrinho 200
    [tags]      DELETE200.2
    Fazer Login e Armazenar Token   valido_sem_carrinho
    DELETE Endpoint "/carrinhos/concluir-compra"
    Validar message: "Não foi encontrado carrinho para esse usuário"
    Validar Status Code "200"

Cenário: DELETE Concluir Compra sem Token 401
    [tags]      DELETE401.1
    DELETE Endpoint "/carrinhos/concluir-compra" Sem Token
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: DELETE Concluir Compra com Token Inválido 401
    [tags]      DELETE401.2
    DELETE Endpoint "/carrinhos/concluir-compra" Token Invalido
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: DELETE Concluir Compra com Token de Usuario Que Não Existe Mais 401
    [tags]      DELETE401.3
    Pega Usuario Estatico           teste_produto
    POST Endpoint /usuarios
    ${idUsuario}                    Set Variable      ${response.json()["_id"]}
    Fazer Login e Armazenar Token   teste_produtos
    DELETE Usuario id "${idUsuario}"
    DELETE Endpoint "/carrinhos/concluir-compra"
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: DELETE Concluir Compra com Token Expirado 401
    [tags]      DELETE401.4
    DELETE Endpoint "/carrinhos/concluir-compra" Token Expirado
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: DELETE Excluir Carrinho e Retornar Produtos ao Estoque 200
    [tags]      DELETE200.3
    Fazer Login e Armazenar Token                       valido_sem_carrinho
    Quantidade Inicial de Produtos no Estoque           carrinho1
    Pega Carrinho Estatico                              carrinho1
    POST Endpoint /carrinhos
    Validar Quantidade de Produtos no Estoque           carrinho1
    DELETE Endpoint "/carrinhos/cancelar-compra"
    Validar message: "Registro excluído com sucesso. Estoque dos produtos reabastecido"
    Validar Status Code "200"
    Validar se Produtos Foram Retornados ao Estoque     carrinho1

Cenário: DELETE Excluir Carrinho para Usuario Sem Carrinho 200
    [tags]      DELETE200.4
    Fazer Login e Armazenar Token                       valido_sem_carrinho
    DELETE Endpoint "/carrinhos/cancelar-compra"
    Validar message: "Não foi encontrado carrinho para esse usuário"
    Validar Status Code "200"

Cenário: DELETE Cancelar Compra com Erro no Token 401
    [tags]      DELETE401.5
    DELETE Endpoint "/carrinhos/cancelar-compra" Sem Token
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: DELETE Cancelar Compra com Token Inválido 401
    [tags]      DELETE401.6
    DELETE Endpoint "/carrinhos/cancelar-compra" Token Invalido
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: DELETE Cancelar Compra com Token de Usuario Que Não Existe Mais 401
    [tags]      DELETE401.7
    Pega Usuario Estatico           teste_produto
    POST Endpoint /usuarios
    ${idUsuario}                    Set Variable      ${response.json()["_id"]}
    Fazer Login e Armazenar Token   teste_produtos
    DELETE Usuario id "${idUsuario}"
    DELETE Endpoint "/carrinhos/cancelar-compra"
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenário: DELETE Cancelar Compra com Token Expirado 401
    [tags]      DELETE401.8
    DELETE Endpoint "/carrinhos/cancelar-compra" Token Expirado
    Validar message: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"