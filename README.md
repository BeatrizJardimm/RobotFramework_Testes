
<div align = "center">
<img src="./midia/compasslogo.png">

# Trilha RoboTron - Projeto Final
</div>

## Notas:

* O erro 403 ('rota exclusiva para administradores') é o mesmo para todas as rotas onde esse erro é possível, então ele está sendo testado apenas uma vez, [nesse arquivo](produtos/TestesProdutos_DELETE.robot)

* As rotas que precisam de token estão sendo testadas apenas uma vez para cada tipo de erro possível, ou seja, existem 4 tipos de erros que podem ser gerados a partir dos tokens, são esses: Token ausente, inválido, expirado ou usuário do token não existe mais. Sendo assim, existe um test case para cada um desses tipos de erros. Esses testes podem ser encontrados em:
    * [Token Expirado](./produtos/TestesProdutos_DELETE.robot)
    * [Token Inválido](./produtos/TestesProdutos_POST.robot)
    * [Token Ausente](./produtos/TestesProdutos_PUT.robot)
    * [Usuário do token não existe mais](./produtos/TestesProdutos_POST.robot)