# Esse arquivo contém os Test Cases que se referem ao DELETE do Endpoint /carrinhos
# Para montar esses Test Cases, foi utilizada a API ServeRest que pode ser encontrada em https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Test Cases *

Cenário: DELETE Excluir Carrinho 200
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso | Não foi encontrado carrinho para esse usuário"

Cenário: DELETE Erro no Token 401
    DELETE Endpoint /carrinhos/concluir-compra com Token Inválido
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário: DELETE Excluir Carrinho e Retornar Produtos ao Estoque 200
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso | Não foi encontrado carrinho para esse usuário"

Cenário: DELETE Erro no Token 401
    DELETE Endpoint /carrinhos/cancelar-compra com Token Expirado
    Validar Status Code "401"
    Validar Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"