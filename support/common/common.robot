* Settings *
Documentation       Keywords e Variaveis que são usadas por todos os arquivos de testes
Library             RequestsLibrary
Library             OperatingSystem

* Keywords *

Validar Status Code "${statuscode}"
    Should Be True          ${response.status_code} == ${statuscode}

Validar Mensagem: "${mensagem}"
    Should Match            ${response.json()["message"]}       ${mensagem}

Validar Nome: "${nome}"
    Should Match            ${response.json()["nome"]}          ${nome}

Printar Conteudo Response
    [Arguments]             ${response}
    Log To Console          Response: ${response.content}

Importar JSON Estatico
    [Arguments]             ${nome_arquivo}
    ${arquivo}              Get File        ${EXECDIR}/../support/fixtures/static/${nome_arquivo}
    &{data}                 Evaluate        json.loads('''${arquivo}''')    json
    [return]                ${data}