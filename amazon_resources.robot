*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}               https://www.amazon.com.br/
${MENU_ELETRONICOS}  //span[@class='hm-icon-label']

*** Keywords ***
Abrir o navegador
    Open Browser  browser=chrome  options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar a home page do site amazon.com.br
    Go To                            url=${URL}
    Sleep                            time_=15s
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
