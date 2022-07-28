* Settings *

Documentation       Arquivo de Testes para a Library desenvolvida em PYTHON
Library             ./support/common/python_library.py

* Test Cases *

Cenário: Pegar a quantidade total de produtos cadastrados
    ${qnt}              Quantidade Produtos
    Log To Console      Quantidade: ${qnt}

Cenário: Mostrar os nomes de todos os usuários cadastrados
    ${nomes}            Nomes Usuarios
    Log To Console      Nomes: ${nomes}

Cenário: Mostrar os Produtos que não estão em nenhum carrinho
    ${produtos}         Produtos Fora De Carrinhos
    Log To Console      Produtos: ${produtos}

Cenário: Mostrar o nome do Usuário Dono de Determinado Carrinho
    ${usuario}          Usuario Dono Carrinho       qbMqntef4iTOwWfg
    Log To Console      Usuário: ${usuario}

Cenário: Validar o valor total de um carrinho
    [tags]      TESTE
    ${validacao}        Valida Preco Total      qbMqntef4iTOwWfg
    Log To Console      ${validacao}