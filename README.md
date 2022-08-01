
<div align = "center">
<img src="./midia/compasslogo.png">

# Trilha RoboTron - Projeto Final

[![NPM](https://img.shields.io/npm/l/react)](./LICENSE) [![Badge ServeRest](https://img.shields.io/badge/API-ServeRest-yellow)](https://github.com/ServeRest/ServeRest/)
  
</div>

* Este repositório é composto por testes desenvolvidos com o **Robot Framework** para a API **ServeRest**.
* Os testes que compõem esse projeto foram escritos através da IDE **VS Code**.
* A ferramenta **Git** foi usada para transformar o projeto em um repositório e depois armazená-lo no GitHub.

## <img src="./midia/lily.jpg" alt="Lily Aldrin de HIMYM" width="60" height="60" align="right"> Características do Projeto

Este projeto é composto por um conjunto de testes para os endpoints da [API ServeRest](https://serverest.dev/).
<br>

Os arquivos desenvolvidos para este projeto estão organizados da seguinte forma:

| Pasta | Descrição |
| :---: | :---: |
| [keywords](./keywords/) | Arquivos onde foram desenvolvidas as Keywords dos Test Cases para cada endpoint. |
| [midia](./midia/) | Pasta que contém os arquivos de imagem utilizados no presente documento. |
| [outros](./outros/) | Composta por mapas mentais e uma lista dos Test Cases desenvolvidos. |
| [support](./support/) | Contém o arquivo *base.robot* que é utilizado para setar as bibliotecas e arquivos importados para o projeto inteiro. |
| [common](./support/common/) | Pasta composta pelos arquivos com keywords e funções utilizadas por mais de um ou todos os arquivos de Test Cases. |
| [fixtures](./support/fixtures/) | Armazena os arquivos de massa de dados, estáticas e dinâmicas. |
| [variaveis](./support/variaveis/) | Contém um arquivo apenas para setar as variáveis utilizadas ao longo do projeto. |
| [tests](./tests/) | Aqui é onde encontramos os casos de teste do projeto (tanto positivos quanto negativos). Cada Endpoint tem seu arquivo específico. |

Além dos arquivos encontrados em pastas, no escopo global do projeto encontramos a licence utilizada e o documento que você está lendo!
<br>

Por último, também desenvolvi mapas mentais com base na API Serverest. O primeiro mapa foi feito a partir da [documentação](https://serverest.dev/) dessa API, e mostra todos os Status Codes e retornos documentados para cada tipo de requisição.

<div align="center">
    <img src="midia/mapaDocumentacao.jpeg">
</div>

Porém, durante o desenvolvimento dos testes, percebi alguns bugs em relação à documentação. Algumas requisições não retornam as mensagens documentadas e, em outros casos, o Status Code esperado de acordo com a documentação não é o mesmo retornado pela API. Com base nisso, após finalizar todos os casos de teste, desenvolvi outro mapa mental com base no que a API entrega: 

<div align="center">
    <img src="midia/mapaAPI.jpeg">
</div>

Os arquivos correspondentes aos mapas mentais acima podem ser encontrados na pasta [outros](./outros/) juntamente com o arquivo que lista todos os [Casos de Teste](./outros/CasosDeTeste.txt) desenvolvidos.


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

### Configuração do VSCode

Como já foi dito anteriormente, utilizei a IDE VSCode para desenvolver esse projeto, e algumas extensões dessa IDE foram indispensáveis para a organização e o realçamento do código. Recomendo o uso destas extenções para facilitar o desenvolvimetno deste e de outros projetos, segue uma lista com todas as extensões utilizadas:

* Robot Framework Intellisense
* Python (Intellisense oficial)
* Hyper Term Theme
* Material Icon Theme
* Rainbow Brackets
* Tabnine AI autocomplete

## <img src="./midia/barney.jpg" alt="Barney Stinson de HIMYM" width="60" height="60" align="right"> Como rodar o projeto

Primeiramente, você precisa ter o [Python instalado](https://www.python.org/downloads/) em sua máquina (estou usando a versão 3.8.2).
<br>
Depois disso, instale o [Node.js](https://nodejs.org/en/download/) na versão LTS.
<br>
Para verificar se ambos foram instalados corretamente, é só abrir seu console e entrar com os comandos <code>python -v</code> e <code>node -v</code>, assim você verifica qual é a versão na qual foram instalados.
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
Durante a execução dos testes, o console deve ficar parecido com o da imagem abaixo:

<div align="center">
    <img src="midia/promptServerest.jpeg">
</div>

Depois disso, em outro Prompt de Comando, entre com o caminho para o arquivo de teste que você deseja rodar e, quando esse caminho estiver correto, para rodar o arquivo você deve entrar com:
<br>
<code>robot -d ./reports nome_arquivo.robot</code>
<br>
Para exemplificar, abaixo temos uma imagem do console com o comando para rodar os testes do endpoint /login:

<div align="center">
    <img src="midia/exemploTeste.jpeg">
</div>

Além disso, caso você queira rodar apenas um caso de teste específico, sem precisar rodar todos os Test Cases do arquivo, você pode digitar <code>robot -d ./reports -i tag nome_arquivo.robot</code> no seu console, onde "tag" deve ser substituido pela tag do Test Case que você deseja rodar. As tags de um Test Case podem ser encontradas tanto no arquivo de [Casos de Teste](./outros/CasosDeTeste.txt) quanto na primeira linha de um Test Case, como no exemplo abaixo:

<div align="center">
    <img src="midia/exemploTags.jpeg">
</div>

Neste caso, o comando que você deve digitar em seu console é
<br>
<code>robot -d ./reports -i LOGIN200 login_testes.robot</code>

A partir disso, você pode realizar testes em qualquer endpoint para o tipo de requisição de sua escolha!

## <img src="./midia/ted.jpg" alt="Ted Mosby de HIMYM" width="60" height="60" align="right"> Notas e Bugs

* Ao rodar os testes no console, o retorno será algo parecido com: 

<div align="center">
    <img src="midia/exemploRetorno.jpeg">
</div>

Onde a primeira e última linhas apresentam o nome do Test Case, a mensagem de retorno é aquela retornada pela API e o Status Code retornado também é enviado pela API. Caso esses retornos sejam compatíveis com o esperado pelo Test Case em questão, recebemos em verde a mensagem PASS, como é visto na imagem, caso contrário, em vez disso teremos a mensagem FAIL em vermelho.

Para esse projeto, precisei criar dois mapas entais diferentes, um antes de inciar os testes, baseado na documentação, e outro após o dsenvolvimento dos casos de teste, pois ao longo desse desenvolvimento percebi vários bugs na API, desde alguns status codes até algumas responses que não batiam com o esperado a partir da documentação, então, xheguei à conclusão que a documentação está desatualizada, portanto desenvolvi os dois mapas mentais em questão.



* No status 400 da requisição POST no endpoint /carrinhos, a documentação apresenta a mensagem "Não é permitido possuir produto duplicado | Não é permitido ter mais de 1 carrinho | Produto não encontrado | Produto não possui quantidade suficiente" mostrando todas as mensagens que podem ser retornadas com essa requisição, porém estou testando apenas a criação de um segundo carrinho para o mesmo usuário, então a mensagem que espero de retorno é apenas: "Não é permitido ter mais de 1 carrinho"

* Nos status 200 das requisições DELETE de todos os Endpoints, a documentação apresenta a mensagem "Registro excluído com sucesso | Nenhum registro excluído" para evidenciar as possíveis mensagens de retorno, sendo assim, desenvolvi casos de testes para a primeira situação em todos os endpoints, mas a segunda situação não está sendo testada no endpoint /carrinhos.

Além disso, ao longo do processo de desenvolvimento, encontrei um bug relacionado à documentação da API. Na documentação, o Endpoint /login apresenta status de erro 400, porém, se tentarmos realizar os testes esperando esse status de retorno, vamos encontrar um erro, pois na verdade o status que está sendo retornado é 401, então, para coontornar a situação, eu adaptei o código para esperar o status 401 como retorno.

Outro bug que encontrei no endpoint /login foi que o erro 400 não está documentado, porém se tentarmos realizar um login com um usuário sem email ou sem senha, esse erro é retornado acompanhado da mensagem "email/password não pode ficar em branco", então criei casos de testes para ambos os casos.

Na requisição POST do endpoint /usuarios acontece a mesma coisa, então criei os testes para esses erros apesar deles não serem referenciados na documentação.

Mesma coisa no POST do /produtos

Na requisição DELETE de /carrinhos/cancelar-compra a documentação mostra as mensagens "Registro excluído com sucesso | Não foi encontrado carrinho para esse usuário" como possibilidades de retorno, porém quando testamos excluir um carrinho que existe o retorno é "Registro excluído com sucesso. Estoque dos produtos reabastecido"


## Considerações Finais  

Prontinho!
Com base nas informações desse documento, agora você é capaz de acessar, modificar e compartilhar esse projeto!

<div align="center">
    <img src="./midia/comemorando.gif" alt="Personagens comemorando">
</div>

Gostaria de agradecer ao Demétrio Webber, pois eu não teria conseguido concluir (nem começar) esse projeto sem as orientações e aulas dele.
<br>
Também quero dar os devidos créditos aos meus colegas Amanda Bressam e Ney Backes que, além de desenvolverem os seus próprios projetos, me ajudaram com algumas ideias de casos de testes e refinamento de código.
Muito obrigada a todos vocês! :)

* [Perfil da Amanda](https://github.com/abressam)
* [Perfil do Ney](https://github.com/neybackes)

<br>
Além disso, também encontrei soluções para algumas ideias nas documentações das Libraries utilizadas, essas referências se encontram abaixo:

* [BuiltIn Library](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html)
* [Requests Library](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html)
* [GitHub da ServeRest](https://github.com/ServeRest/ServeRest/)

## <img src="./midia/robin.jpg" alt="Robin de HIMYM" width="60" height="60" align="right"> Autora

Meu perfil no [GitHub](https://github.com/BeatrizJardimm).
<br>
Meu perfil no [LinkedIn](https://www.linkedin.com/in/paula-beatriz-jardim-11882521a/).