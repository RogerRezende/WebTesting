*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}                               https://www.amazon.com.br/
${MENU_TODOS}                        //span[@class='hm-icon-label']
${HEADER_ELETRONICOS}                //div[@class='_Y29ud_bxcGridText_3AiaV _Y29ud_cgTextLeft_3L3pI _Y29ud_bxcGridTextLight_f2KTn']//span[contains(text(),'Eletrônicos e Tecnologia')]
${CAMPO_PESQUISA}                    twotabsearchtextbox
${BOTAO_PESQUISAR}                   nav-search-submit-button
${TITULO_PAGINA_PESQUISAR}           Resultados

*** Keywords ***
Abrir o navegador
    Open Browser                     browser=chrome  options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site amazon.com.br
    Go To                            url=${URL}
    Sleep                            time_=15s
    Wait Until Element Is Visible    locator=${MENU_TODOS}

Entra no menu "${MENU}"
    Click Element                    locator=//a[contains(text(),'${MENU}')]

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains         text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be                  title=${TITULO}

Verificar se aparece a categoria "${CATEGORIA}"
    Page Should Contain              text=${CATEGORIA}
    Element Should Be Visible        locator=//span[@class='nav-a-content'][normalize-space()='${CATEGORIA}']

Digitar o nome do produto "${PESQUISA}" no campo de pesquisa
    Click Element                    locator=${CAMPO_PESQUISA}
    Input Text                       locator=${CAMPO_PESQUISA}                                                      text=${PESQUISA}

Clicar no botão de pesquisa
    Click Button                     locator=${BOTAO_PESQUISAR}
    Wait Until Page Contains         text=${TITULO_PAGINA_PESQUISAR}

Verificar o resultado da pesquisa se está listando o produto "${PESQUISA}"
    Title Should Be                  title=Amazon.com.br : ${PESQUISA}
    Page Should Contain              text=${PESQUISA}
