# Esse arquivo contém os Test Cases que se referem ao POST do Endpoint /carrinhos
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Test Cases *

Cenário: POST Cadastrar Carrinho 201
    Criar Novo Carrinho Dinâmicos
    POST Carrinho Dinâmico no Endpoint "/carrinhos"
    Validar Status Code "201"
    Validar Mensagem: "Cadastro realizado com sucesso"

Cenário: POST Erro no Cadastro 400
    POST Carrinho com id já Utilizada
    Validar Status Code "400"
    Validar Mensagem: "Não é permitido possuir produto duplicado | Não é permitido ter mais de 1 carrinho | Produto não encontrado | Produto não possui quantidade suficiente"

Cenário: POST Erro no Token 401
    POST Carrinho Sem Token
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"