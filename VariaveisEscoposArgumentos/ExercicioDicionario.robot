*** Settings ***
Documentation   Exemplo de tipos de variáveis: SIMPLES, LISTAS e DICIONÁRIOS
*** Variable ***
#Tipo Dicionário (chave=valor) - separar cada chave=valor com espaço duplo
&{DIAS_POR_MES}    janeiro=31   
...                fevereiro=28   
...                março=31   
...                abril=30
...                maio=31
...                junho=30
...                julho=31
...                agosto=31
...                setembro=30
...                outubro=31
...                novembro=30
...                dezembro=31

*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    # Lendo chaves de um Dicionário
    Log To Console   Janeiro - ${DIAS_POR_MES.janeiro} dias
    Log To Console   Fevereiro - ${DIAS_POR_MES.fevereiro} dias
    Log To Console   Março - ${DIAS_POR_MES.março} dias
    Log To Console   Abril - ${DIAS_POR_MES.abril} dias
    Log To Console   Maio - ${DIAS_POR_MES.maio} dias
    Log To Console   Junho - ${DIAS_POR_MES.junho} dias
    Log To Console   Julho - ${DIAS_POR_MES.julho} dias
    Log To Console   Agosto - ${DIAS_POR_MES.agosto} dias
    Log To Console   Setembro - ${DIAS_POR_MES.setembro} dias
    Log To Console   Outubro - ${DIAS_POR_MES.outubro} dias
    Log To Console   Novembro - ${DIAS_POR_MES.novembro} dias
    Log To Console   Dezembro - ${DIAS_POR_MES.dezembro} dias
