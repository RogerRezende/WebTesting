*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${ALIAS}                                       ServeRest
${URL}                                         https://serverest.dev

*** Keywords ***
Criar um usuário novo
    ${palavra_aleatoria}                       Generate Random String    
    ...                                        length=4                
    ...                                        chars=[LETTERS]
    ${palavra_aleatoria}                       Convert To Lower Case     
    ...                                        string=${palavra_aleatoria}
    Log                                        Minha palavra aleatoria: ${palavra_aleatoria}@emailteste.com
    Set Test Variable                          ${EMAIL_TESTE}            ${palavra_aleatoria}@emailteste.com

Cadastrar o usuário criado na ServeRest
    [Arguments]                                ${email}                  ${status_code_desejado}
    ${body}                                    Create Dictionary         
    ...                                        nome=Fulano da Silva    
    ...                                        email=${email}    
    ...                                        password=teste    
    ...                                        administrador=true
    Log                                        ${body}
    Criar Sessão na ServeRest
    ${resposta}                                POST On Session
    ...                                        alias=${ALIAS}
    ...                                        url=/usuarios
    ...                                        json=${body}
    ...                                        expected_status=${status_code_desejado}
    Log                                        ${resposta.json()}

    IF    ${resposta.status_code} == 201
        Set Test Variable                      ${ID_USUARIO}             ${resposta.json()["_id"]}
    END

    Set Test Variable                          ${NOME_USUARIO}           ${body["nome"]}
    Set Test Variable                          ${PASSWORD_USUARIO}       ${body["password"]}
    Set Test Variable                          ${ADMINISTRADOR_USUARIO}  ${body["administrador"]}
    Set Test Variable                          ${RESPOSTA}               ${resposta.json()}
    
Criar Sessão na ServeRest
    ${headers}                                 Create Dictionary
    ...                                        accept=application/json
    ...                                        Content-Type=application/json
    Create Session                             alias=${ALIAS}            
    ...                                        url=${URL}              
    ...                                        headers=${headers}
    Log                                        ${headers}

Validar se o usuário foi cadastrado corretamente
    Log                                        ${RESPOSTA}
    Dictionary Should Contain Item             ${RESPOSTA}               message                   Cadastro realizado com sucesso
    Dictionary Should Contain Key              ${RESPOSTA}               _id

Vou repetir o cadastro do usuário
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TESTE}      status_code_desejado=400

Validar que ocorre uma mensagem de erro ao tentar cadastrar novamente o usuário
    Log                                        ${RESPOSTA}
    Dictionary Should Contain Item             ${RESPOSTA}               message                   Este email já está sendo usado

Consultar os dados do novo usuário
    [Arguments]                                ${status_code_desejado}
    ${resposta_consulta}                       GET On Session
    ...                                        alias=${ALIAS}
    ...                                        url=/usuarios/${ID_USUARIO}
    ...                                        expected_status=${status_code_desejado}
    Log                                        ${resposta_consulta.json()}
    Set Test Variable                          ${RESPOSTA_CONSULTA}      ${resposta_consulta.json()}

Validar se os dados do usuário foram exibidos corretamente
    Log                                        ${RESPOSTA_CONSULTA}
    Dictionary Should Contain Item             ${RESPOSTA_CONSULTA}      nome                      ${NOME_USUARIO}
    Dictionary Should Contain Item             ${RESPOSTA_CONSULTA}      email                     ${EMAIL_TESTE}
    Dictionary Should Contain Item             ${RESPOSTA_CONSULTA}      password                  ${PASSWORD_USUARIO}
    Dictionary Should Contain Item             ${RESPOSTA_CONSULTA}      administrador             ${ADMINISTRADOR_USUARIO}
    Dictionary Should Contain Item             ${RESPOSTA_CONSULTA}      _id                       ${ID_USUARIO}

Realizar login com o usuário
    [Arguments]                                ${status_code_desejado}
    ${body}                                    Create Dictionary       
    ...                                        email=${EMAIL_TESTE}    
    ...                                        password=${PASSWORD_USUARIO}    
    Log                                        ${body}
    ${resposta}                                POST On Session
    ...                                        alias=${ALIAS}
    ...                                        url=/login
    ...                                        json=${body}
    ...                                        expected_status=${status_code_desejado}
    Log                                        ${resposta.json()}