# Área para definir as configurações do arquivo
* Settings *
Documentation   Arquivo para Test Cases no Endpoint /carrinhos
Resource        ../keywords/carrinhos_keywords.robot

#Área para escrever os casos que serão testados
* Test Cases *
Cenário: GET Todos os Carrinhos 200
    [tags]      GET200.1
    Criar Sessao
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenário: GET Carrinho Específico 200
    [tags]      GET200.2
    Criar Sessao
    GET Endpoint /carrinhos id "/qbMqntef4iTOwWfg"
    Validar Status Code "200"
    Validar id: "qbMqntef4iTOwWfg"

Cenário: GET Carrinho Inexistente 400
    [tags]      GET400
    Criar Sessao
    GET Endpoint /carrinhos id "Inexistente"
    Validar Status Code "400"
    Validar Mensagem: "Carrinho não encontrado"

Cenário: POST Cadastrar Carrinho 201
    [tags]      POST201
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"
    DELETE Endpoint "/carrinhos/cancelar-compra"
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso. Estoque dos produtos reabastecido"

Cenário: POST Erro no Cadastro 400
    [tags]      POST400
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"
    Criar Outro Carrinho Estatico Valido Para o Mesmo Usuario
    Validar Status Code "400"
    Validar Mensagem: "Não é permitido ter mais de 1 carrinho"
    DELETE Endpoint "/carrinhos/cancelar-compra"
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso. Estoque dos produtos reabastecido"

Cenário: POST Erro no Token 401
    [tags]      POST401
    Criar Sessao
    POST Carrinho Sem Token
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: DELETE Concluir Compra e Excluir Carrinho 200
    [tags]      DELETE200.1
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"
    DELETE Endpoint "/carrinhos/concluir-compra"
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso"

Cenário: DELETE Concluir Compra com Erro no Token 401
    [tags]      DELETE401.1
    Criar Sessao
    DELETE Endpoint "/carrinhos/concluir-compra" Sem Token
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: DELETE Excluir Carrinho e Retornar Produtos ao Estoque 200
    [tags]      DELETE200.2
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"
    DELETE Endpoint "/carrinhos/cancelar-compra"
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso. Estoque dos produtos reabastecido"

Cenário: DELETE Cancelar Compra com Erro no Token 401
    [tags]      DELETE401.2
    Criar Sessao
    DELETE Endpoint "/carrinhos/cancelar-compra" Sem Token
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"