*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${ALIAS}                              ServeRest
${URL}                                https://serverest.dev

*** Keywords ***
Criar um usuário novo
    ${palavra_aleatoria}              Generate Random String    
    ...                               length=4                
    ...                               chars=[LETTERS]
    ${palavra_aleatoria}              Convert To Lower Case     
    ...                               string=${palavra_aleatoria}
    Log                               Minha palavra aleatoria: ${palavra_aleatoria}@emailteste.com
    Set Test Variable                 ${EMAIL_TESTE}            ${palavra_aleatoria}@emailteste.com

Cadastrar o usuário criado na ServeRest
    ${body}                           Create Dictionary         
    ...                               nome=Fulano da Silva    
    ...                               email=${EMAIL_TESTE}    
    ...                               password=teste    
    ...                               administrador=true
    Log                               ${body}
    Criar Sessão na ServeRest
    ${resposta}                       POST On Session
    ...                               alias=${ALIAS}
    ...                               url=/usuarios
    ...                               json=${body}
    Log                               ${resposta.json()}
    Set Test Variable                 ${RESPOSTA}               ${resposta.json()}
    
Criar Sessão na ServeRest
    ${headers}                        Create Dictionary
    ...                               accept=application/json
    ...                               Content-Type=application/json
    Create Session                    alias=${ALIAS}            
    ...                               url=${URL}              
    ...                               headers=${headers}
    Log                               ${headers}

Validar se o usuário foi cadastrado corretamente
    Log                               ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}               message                   Cadastro realizado com sucesso
    Dictionary Should Contain Key     ${RESPOSTA}               _id
