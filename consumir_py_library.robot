* Settings *

Documentation       Arquivo de Testes para a Library desenvolvida em PYTHON
Library             python_library.py

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