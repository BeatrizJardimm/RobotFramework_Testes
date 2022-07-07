# Esse arquivo contém os Test Cases que se referem ao DELETE do Endpoint /usuarios
# API ServeRest: https://serverest.dev/
# Existem Test Cases para todos os casos, tanto de sucesso quanto de erro

* Test Cases *

Cenário: DELETE Excluir Usuário Existente 200
    DELETE Usuario Específico de id "/0uxuPY0cbmQhpEz1"
    Validar Status Code "200"
    Validar Mensagem: "Registro excluído com sucesso | Nenhum registro excluído"

Cenário: DELETE Excluir Usuário com Carrinho Cadastrado 400
    DELETE Usuario com Carrinho Ativo
    Validar Status Code "400"
    Validar Mensagem: "Não é permitido excluir usuário com carrinho cadastrado"