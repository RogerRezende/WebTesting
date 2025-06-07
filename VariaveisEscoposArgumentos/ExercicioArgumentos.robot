*** Settings ***
Documentation   Exemplo de uso de variáveis como argumentos em Keywords
Library    String

*** Variable ***
&{PESSOA}       nome=bruce   sobrenome=wayne

*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    ${MENSAGEM_ALERTA}          Uma subkeyword com retorno    ${PESSOA.nome}   ${PESSOA.sobrenome}
    Log To Console              ${MENSAGEM_ALERTA}

Uma subkeyword com retorno
    [Arguments]                 ${NOME}                       ${SOBRENOME}
    ${palavra_aleatoria}        Generate Random String
    ...                         length=4
    ${MENSAGEM}                 Set Variable                  ${NOME}${SOBRENOME}${palavra_aleatoria}@testerobot.com
    [Return]        ${MENSAGEM}
