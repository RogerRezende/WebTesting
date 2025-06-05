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
    Validar que ocorre uma mensagem de erro ao tentar cadastrar novamente o usuário

Cenário 03: Consultar os dados de um novo usuário
    [Documentation]    Este teste consulta os dados de um novo usuário na ServeRest
    [Tags]             consultar_dados_usuario
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Consultar os dados do novo usuário         status_code_desejado=200
    Validar se os dados do usuário foram exibidos corretamente

Cenário 04: Logar com o novo usuário cadastrado
    [Documentation]    Este teste realizar o login de um novo usuário na ServeRest
    [Tags]             login_usuario
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Realizar login com o usuário               status_code_desejado=200
    Conferir se o login ocorreu com sucesso
