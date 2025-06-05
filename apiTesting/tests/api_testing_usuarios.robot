*** Settings ***
Resource    ../resources/api_testing_usuarios_resource.robot

*** Variables ***

*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
    [Documentation]    Este teste cadastra um usuário novo com sucesso na ServeRest
    [Tags]             criar_usuario
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Validar se o usuário foi cadastrado corretamente

Cenário 02: Cadastrar um usuário já existente
    [Documentation]    Este teste gera um erro ao tentar cadastrar um usuário já existente na ServeRest
    [Tags]             criar_usuario_negativo
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Vou repetir o cadastro do usuário
    # Validar que ocorre uma mensagem de erro ao tentar cadastrar novamente o usuário
