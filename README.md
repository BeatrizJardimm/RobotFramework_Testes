
<div align = "center">
<img src="./midia/compasslogo.png">

# Trilha RoboTron - Projeto Final

[![NPM](https://img.shields.io/npm/l/react)](https://github.com/BeatrizJardimm/RoboTron_Beatriz_Jardim_Projeto_Final/blob/develop/LICENSE)
  
</div>

* Esse repositório é composto por testes desenvolvidos com o **Robot Framework**.
* Os testes que compõem esse projeto foram escritos através da IDE **VS Code**.
* A ferramenta **Git** foi usada para transformar o projeto em um repositório e depois armazená-lo no GitHub.

## <img src="./midia/lily.jpg" alt="Lily Aldrin de HIMYM" width="60" height="60" align="right"> Características do Projeto

Este projeto é composto por um conjunto de testes para os requests da [API Serverest](https://serverest.dev/).
<br>

Os testes que compõem esse projeto foram organizados em pastas, cada uma contém os testes feitos para o endpoint que dá nome à pasta. Além disso, os testes estão divididos por requisições e os testes correspondentes a cada tipo de requisição (GET, POST, PUT e DELETE) são encontrados em arquivos diferentes.
Em cada arquivos estão os Test Cases para sua respectiva requisição, entre esses Test Cases estão os cenários de Sucesso (com status 200) e de Erro (com status 400).

Além desses arquivos principais, também temos a pasta *midia*, que contém as imagens presentes nesse documento, e os arquivos *JSON* que são compostos por objetos desenvolvidos para servirem de dados para testes que envolvem criar e editar um usuário, produto ou carrinho.

Por último, o arquvio *common.robot* que está presente nesse projeto, contém as Keywords que são utilizadas em todos os Test Cases do projeto, então para não precisar escrevê-las repetidamente em todos os arquivos, elas se encontram em um arquivo a parte e são apenas chamadas nesses Test Cases.

## <img src="./midia/marshall.jpg" alt="Marshall de HIMYM" width="60" height="60" align="right"> Como criar uma cópia desse projeto

Para obter uma cópia desse projeto em sua máquina local, siga os passos abaixo:

1. Crie um *Fork* desse projeto no seu perfil do GitHub
2. Instale a IDE de sua preferência* que seja compatível com a linguagem Python ([Aqui](https://blog.geekhunter.com.br/ides-e-editores-de-codigo-em-python-para-2021/) estão algumas opções).
3. Instale a versão do [Git](https://git-scm.com/downloads) compatível com seu sistema operacional.
4. Depois de [configurar o Git](https://www.youtube.com/watch?v=UBAX-13g8OM) em sua máquina, rode o seguinte código:

<code>
$ git clone https://github.com/BeatrizJardimm/RoboTron_Beatriz_Jardim_Projeto_Final.git

</code>

Agora você tem uma cópia dos exercícios em sua máquina! :)

*Eu utilizei o **VS CODE**, e a partir [desse artigo](https://asimov.academy/como-instalar-e-configurar-o-vscode/) ou [desse vídeo](https://www.youtube.com/watch?v=-RuY-rM-B4M&t=1s) você pode configurar tal IDE pra executar arquivos na linguagem Python.

## <img src="./midia/barney.jpg" alt="Barney Stinson de HIMYM" width="60" height="60" align="right"> Como rodar o projeto

Primeiramente, você precisa ter o [Python instalado](https://www.python.org/downloads/) em sua máquina (estou usando a versão 3.8.2).
<br>
Depois disso, instale o [Node.js](https://nodejs.org/en/download/) na versão LTS.
<br>
Para verificar se ambos foram instalados corretamente, é só abrir seu console e entrar com os comandos <code> python -v </code> e <code> node -v </code>, assim você verifica qual é a versão na qual foram instalados.
<br>
<br>
Agora, para instalar o Robot Framework para Windows, vamos utilizar o pip install do Python, então, abra novamente seu Prompt de Comando e entre com <code>pip install robotframework</code>.
<br>
Caso seu sistema operacional não seja Windows, você pode encontrar o modo de instalação correto para sua máquina através desse [link](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#installation-instructions).
<br>
Rode <code>robot --version</code> para verificar se este framework foi instalado corretamente e qual é a sua versão.
<br>
<br>
Nesse projeto, utilizamos algumas libraries do Robot Framework e, para instalar essas bibliotecas, entre com os seguintes comandos em seu console:
<br>
<code>pip install robotframework-browser </code>
<br>
<code>pip install robotframework-requests</code>
<br>
<code>pip install robotframework-faker</code>
<br>
Tenha em mente que todas essas libraries são essenciais e, caso alguma delas não esteja devidamente instalada, o projeto não será executável.

Agora, abra o Prompt de Comando de seu computador e rode o código <code>npx serverest</code> para alocar a API trabalhada nesse projeto em sua máquina local.
<br>
Quando você rodar esse código pela primeira vez, a API Serverest será instalada, porém você PRECISA rodar esse comando toda vez que for realizar algum teste, pois é a partir dele que a API é inicializada. Os testes não irão funcionar se esse comando não for rodado. Além disso, esse prompt deve permanecer aberto durante o tempo de execução dos testes.
<br>
<br>
O console deve ficar parecido com o da imagem abaixo:

<div align="center">
    <img src="midia/promptServerest.jpeg">
</div>

Depois disso, em outro Prompt de Comando, entre com o caminho para o arquivo de teste que você deseja rodar e, quando esse caminho estiver correto, para rodar o arquivo você deve entrar com:
<br>
<code>robot -d ./reports nome_arquivo.robot</code>
<br>
Para exemplificar, abaixo temos uma imagem do console com o comando para rodar os testes das requisições GET do endpoint /usuarios:

<div align="center">
    <img src="midia/exemploGet.jpeg">
</div>

Além disso, caso você queira rodar apenas um caso de teste específico, sem precisar rodar todos os Test Cases do arquivo, você pode digitar <code>robot -d ./reports -i tag nome_arquivo.robot</code> no seu console, onde "tag" deve ser substituido pela tag do Test Case que você deseja rodar. As tags de um Test Case podem ser encontradas na primeira linha destes, como no exemplo abaixo:

<div align="center">
    <img src="midia/exemploTag.jpeg">
</div>

Neste caso, o comando que você deve digitar em seu console é
<br>
<code>robot -d ./reportsGET -i GET200.1 TestesUsuarios_GET.robot</code>

A partir disso, você pode realizar testes em qualquer endpoint para o tipo de requisição de sua escolha!

### Configuração do VSCode

Como já foi dito anteriormente, utilizei a IDE VSCode para desenvolver esse projeto, e algumas extensões dessa IDE foram indispensáveis para a organização e o realçamento do código. Recomendo o uso destas extenções para facilitar o desenvolvimetno deste e de outros projetos, segue uma lista com todas as extensões utilizadas:

* Robot Framework Intellisense
* Python (Intellisense oficial)
* Hyper Term Theme
* Material Icon Theme
* Rainbow Brackets
* Tabnine AI autocomplete

## <img src="./midia/ted.jpg" alt="Ted Mosby de HIMYM" width="60" height="60" align="right"> Nota

O erro 403 ('rota exclusiva para administradores') é o mesmo para todas as rotas onde esse erro é possível, então ele está sendo testado apenas uma vez, [nesse arquivo](produtos/TestesProdutos_DELETE.robot).

## Considerações Finais  

Prontinho!
Com base nas informações desse documento, agora você é capaz de acessar, modificar e compartilhar esse projeto!

<div align="center">
    <img src="./midia/comemorando.gif" alt="Personagens comemorando">
</div>

## <img src="./midia/robin.jpg" alt="Robin de HIMYM" width="60" height="60" align="right"> Autora

Meu perfil no [GitHub](https://github.com/BeatrizJardimm).
<br>
Meu perfil no [LinkedIn](https://www.linkedin.com/in/paula-beatriz-jardim-11882521a/).