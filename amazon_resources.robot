*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}                               https://www.amazon.com.br/
${MENU_TODOS}                        //span[@class='hm-icon-label']
${MENU_ELETRONICOS}                  //a[contains(text(),'Eletrônicos')]
${TEXTO_HEADER_ELETRONICOS}          Eletrônicos e Tecnologia
${HEADER_ELETRONICOS}                //div[@class='_Y29ud_bxcGridText_3AiaV _Y29ud_cgTextLeft_3L3pI _Y29ud_bxcGridTextLight_f2KTn']//span[contains(text(),'Eletrônicos e Tecnologia')]

*** Keywords ***
Abrir o navegador
    Open Browser                     browser=chrome  options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar a home page do site amazon.com.br
    Go To                            url=${URL}
    Sleep                            time_=15s
    Wait Until Element Is Visible    locator=${MENU_TODOS}

Entra no menu "Eletrônicos"
    Click Element                    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains         text=${TEXTO_HEADER_ELETRONICOS}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}
