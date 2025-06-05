*** Settings ***
Resource    ../resources/api_testing_usuarios_resource.robot

*** Variables ***

*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
    [Documentation]    Este teste cadastra um usuário novo com sucesso na ServeRest
    [Tags]             criar_usuario
    Criar um usuário novo
    # Cadastrar o usuário criado na ServeRest
    # Validar se o usuárioi foi cadastrado corretamente
