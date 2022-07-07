# Esse arquivo contém os Test Cases que se referem ao DELETE do Endpoint /produtos
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Test Cases *

Cenário: DELETE Excluir Produto Específico 200
    DELETE Produto Específico com id "/0uxuPY0cbmQhpEz1"
    Validar Status Code 200
    Validar Mensagem: "Registro excluído com sucesso | Nenhum registro excluído"

Cenário: DELETE Excluir Produto que está no Carrinho 400
    DELETE Produto Dentro de um Carrinho
    Validar Status Code "400"
    Validar Mensagem: "Não é permitido excluir produto que faz parte de carrinho"

Cenário: DELETE Erro no Token 401
    DELETE Produto com Token Expirado
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: DELETE Acesso Apenas ao Administrador 403
    DELETE Produto com Parametro Administrador
    Validar Status Code "403"
    Validar Mensagem: "Rota exclusiva para administradores"