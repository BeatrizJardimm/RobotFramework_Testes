# Esse arquivo contém os Test Cases que serão utilizados no Projeto Final
# Para montar esses Test Cases, foi utilizada a API ServeRest que pode ser encontrada em https://serverest.dev/
# Os Test Cases foram criados para todos os endpoints possíveis
# No momento, existem Test Cases para todos os casos de sucesso e alguns casos de erros

* Test Cases *

########## ENDPOINT /LOGIN ##########

Cenário: POST Realizar Login 200
    POST no Endpoint /login o Email "fulano@qa.com" com a Senha "teste"
    Validar o Status Code "200"
    Validar Mensagem: "Login realizado com sucesso"

Cenário: POST Realizar Login com Email Inválido 400
    POST Email Inválido com a Senha "teste" no Endpoint /login
    Validar Status Code 400
    Validar Mensagem: "Email e/ou senha inválidos"

Cenário: POST Realizar Login com Senha Inválida 400
    POST Senha Inválida com o Email "fulano@qa.com" no Endpoint /login
    Validar Status Code "400"
    Validar Mensagem: "Email e/ou senha inválidos"

########## ENDPOINT /USUARIOS ##########

#### GET
Cenário: GET Todos os Usuários 200
    GET Endpoint /usuarios
    Validar Todos os Usuarios
    Validar Status Code "200"

Cenário: GET Usuário Específico 200
    GET Endpoint /usuarios com id "/0uxuPY0cbmQhpEz1"
    Validar Status Code "200"
    Validar Mensagem: "Nome - Fulano da Silva"

Cenário: GET Usuário Inexistente 400
    GET Endpoint /usuarios com id Inexistente
    Validar Status Code "400"
    Validar Mensagem: "Usuário não encontrado"

#### POST
Cenário: POST Cadastrar Novo Usuario 201
    Criar Usuario Dinâmico
    POST Usuario Dinâmico no Endpoint /usuarios
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"

Cenário: POST Cadastrar Novo Usuário com Email Já Cadastrado 400
    POST Usuário Dinâmico com Email já Cadastrado no Endpoint /usuarios
    Validar Status Code "400"
    Validar Mensagem: "Este email já está sendo usado"

#### PUT
Cenário: PUT Editar Usuario Existente 200
    PUT Editar Usuario de id "/0uxuPY0cbmQhpEz1" Usando Dados Dinâmicos
    Validar Status Code "200"
    Validar Mensagem: "Registro alterado com sucesso"

Cenário: PUT Cadastrar novo Usuario 201
    PUT Criar Usuário Com Uma Nova id no Endpoint /usuarios
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"

Cenário: PUT Mudar Email de um Usuário para outro que já está Sendo Utilizado 400
    PUT no Endpoint /usuarios/0uxuPY0cbmQhpEz1 Colocar um Email que está sendo Utilizado por outro Usuario
    Validar Status Code "400"
    Validar Mensagem: "Este email já está sendo usado"

#### DELETE
Cenário: DELETE Excluir Usuário Existente 200
    DELETE Usuario Específico de id "/0uxuPY0cbmQhpEz1"
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso | Nenhum registro excluído"

Cenário: DELETE Excluir Usuário com Carrinho Cadastrado 400
    DELETE Usuario com Carrinho Ativo
    Validar Status Code "400"
    Validar Mensagem: "Não é permitido excluir usuário com carrinho cadastrado"

########## ENDPOINT /PRODUTOS ##########

Cenário: GET Todos os Produtos 200
    GET Endpoint /produtos
    Validar Todos os Produtos
    Validar o Status Code "200"

Cenário: GET Produto Específico 200
    GET Endpoint /produtos com id "/BeeJh5lz3k6kSIzA"
    Validar Produto com id "/BeeJh5lz3k6kSIzA"
    Validar Status Code "200"
    Validar Mensagem: "Nome - Logitech MX Vertical"

Cenário: POST Cadastrar Novo Produto 201
    Criar Novo Produto Dinâmico
    POST Produto Dinâmico no Endpoint /produtos
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"

Cenário: PUT Editar Produto Existente 200
    PUT Editar Produto com id "/0uxuPY0cbmQhpEz1" Usando Dados Dinâmicos
    Validar Status Code "200"
    Validar Mensagem: "Registro alterado com sucesso"

Cenário: DELETE Excluir Produto Específico 200
    DELETE Produto Específico com id "/0uxuPY0cbmQhpEz1"
    Validar Status Code 200
    Validar Mensagem: "Registro excluído com sucesso | Nenhum registro excluído"

########## ENDPOINT /CARRINHOS ##########

Cenário: GET Todos os Carrinhos 200
    GET Endpoint /carrinhos
    Validar Todos os Carrinhos
    Validar o Status Code "200"

Cenário: GET Carrinho Específico 200
    GET Endpoint /carrinhos com id "/qbMqntef4iTOwWfg"
    Validar Carrinho com id "/qbMqntef4iTOwWfg"
    Validar Status Code "200"
    Validar Mensagem: "_id - qbMqntef4iTOwWfg"

Cenário: POST Cadastrar Carrinho 201
    Criar Novo Carrinho Dinâmicos
    POST Carrinho Dinâmico no Endpoint "/carrinhos"
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"

Cenário: DELETE Excluir Carrinho 200
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso | Não foi encontrado carrinho para esse usuário"

Cenário: DELETE Excluir Carrinho e Retornar Produtos ao Estoque 200
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso | Não foi encontrado carrinho para esse usuário"