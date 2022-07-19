* Settings *
Documentation    Keywords e variáveis para a criação de dados dinâmicos
Library          FakerLibrary

* Keywords *

Criar Dados Usuario Valido
    ${nome}                 FakerLibrary.Name
    ${email}                FakerLibrary.Email
    ${senha}                FakerLibrary.Password
    ${payload}              Create Dictionary       nome=${nome}    email=${email}  password=${senha}   administrador=true
    Log To Console          ${payload}
    Set Global Variable     ${payload}

Editar Dados Usuario Valido
    [Arguments]             ${email}
    ${nome}                 FakerLibrary.Name
    ${senha}                FakerLibrary.Password
    ${payload}              Create Dictionary       nome=${nome}    email=${email}  password=${senha}   administrador=true
    Log To Console          ${payload}
    Set Global Variable     ${payload}

Criar Dados Produto Valido
    ${nome}                 FakerLibrary.Name
    ${preco}                FakerLibrary.RandomInt  max=9999
    ${desc}                 FakerLibrary.Text       max_nb_chars=25
    ${qnt}                  FakerLibrary.RandomInt  max=999
    ${payload}              Create Dictionary       nome=${nome}    preco=${preco}  descricao=${desc}   quantidade=${qnt}
    Log To Console          ${payload}
    Set Global Variable     ${payload}

Editar Dados Produto Valido
    [Arguments]             ${nome}
    ${preco}                FakerLibrary.RandomInt  max=9999
    ${desc}                 FakerLibrary.Text       max_nb_chars=25
    ${qnt}                  FakerLibrary.RandomInt  max=999
    ${payload}              Create Dictionary       nome=${nome}    preco=${preco}  descricao=${desc}   quantidade=${qnt}
    Log To Console          ${payload}
    Set Global Variable     ${payload}