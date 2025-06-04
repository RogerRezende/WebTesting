*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}                           chrome
${URL}                               https://www.amazon.com.br/
${MENU_TODOS}                        //span[@class='hm-icon-label']
${HEADER_ELETRONICOS}                //div[@class='_Y29ud_bxcGridText_3AiaV _Y29ud_cgTextLeft_3L3pI _Y29ud_bxcGridTextLight_f2KTn']//span[contains(text(),'Eletrônicos e Tecnologia')]
${CAMPO_PESQUISA}                    twotabsearchtextbox
${BOTAO_PESQUISAR}                   nav-search-submit-button
${TITULO_PAGINA_PESQUISAR}           Resultados
${TITULO_PDP}                        productTitle
${BOTAO_ADICIONAR_CARRINHO}          add-to-cart-button-ubb
${HEADER_PAGINA_PRODUTO_ADICIONADO}  Adicionado ao carrinho
${CARRINHO}                          nav-cart-count
${TITULO_PAGINA_CARRINHO}            Carrinho de compras da Amazon.com
${BOTAO_IR_PARA_CARRINHO_INTERNO}    //span[@id='sw-gtc']
${HEADER_CARRINHO}                   Carrinho de compras
${EXCLUIR_PRODUTO_CARRINHO}          //span[@class='a-size-small sc-action-delete-active']

*** Keywords ***
Abrir o navegador
    Open Browser                     browser=${BROWSER}  options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

# Procedural steps
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
    Page Should Contain              text=${PESQUISA}

Verificar se o título da página exibe o conteúdo da pesquisa "${PESQUISA}"
    Page Should Contain              text=Amazon.com.br : ${PESQUISA}

Adicionar o produto "${PESQUISA}" no carrinho
    Click Element                    locator=//span[normalize-space()='${PESQUISA}']
    Wait Until Element Is Visible    locator=${TITULO_PDP}
    Click Button                     locator=${BOTAO_ADICIONAR_CARRINHO}

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Page Contains         text=${HEADER_PAGINA_PRODUTO_ADICIONADO}
    Element Should Contain           locator=${CARRINHO}    expected=1
    Title Should Be                  title=${TITULO_PAGINA_CARRINHO}

Remover o produto "Console Xbox Series S" do carrinho
    Wait Until Element Is Visible    locator=${BOTAO_IR_PARA_CARRINHO_INTERNO}
    Click Element                    locator=${BOTAO_IR_PARA_CARRINHO_INTERNO}
    Wait Until Page Contains         text=${HEADER_CARRINHO}
    Click Element                    locator=${EXCLUIR_PRODUTO_CARRINHO}

Verificar se o carrinho fica vazio
    Element Should Contain           locator=${CARRINHO}    expected=0

# Gherkin steps
Dado que estou na home page da amazon.com.br
    Acessar a home page do site amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entra no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome do produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Console Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

Quando adicionar o produto "Console Xbox Series S" no carrinho
    Digitar o nome do produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho

Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E existe o produto "Console Xbox Series S" no carrinho
    Digitar o nome do produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio
