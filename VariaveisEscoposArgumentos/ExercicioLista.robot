*** Settings ***
Documentation   Exercício com lista dos meses do ano
Library    SeleniumLibrary

*** Variables ***
#Tipo Lista (arrays) - separar itens com espaço duplo
@{MESES}    janeiro    fevereiro    março    abril    maio    junho    julho    agosto    setembro    outubro    novembro    dezembro

*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    # Lendo um item de uma Lista
    Log To Console   Primeiro mês do ano - ${MESES[0]}
    Log To Console   Segundo mês do ano - ${MESES[1]}
    Log To Console   Terceiro mês do ano - ${MESES[2]}
    Log To Console   Quarto mês do ano - ${MESES[3]}
    Log To Console   Quinto mês do ano - ${MESES[4]}
    Log To Console   Sexto mês do ano - ${MESES[5]}
    Log To Console   Sétimo mês do ano - ${MESES[6]}
    Log To Console   Oitavo mês do ano - ${MESES[7]}
    Log To Console   Nono mês do ano - ${MESES[8]}
    Log To Console   Décimo mês do ano - ${MESES[9]}
    Log To Console   Décimo primeiro mês do ano - ${MESES[10]}
    Log To Console   Décimo segundo mês do ano - ${MESES[11]}
