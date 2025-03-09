*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Resource       ../resources/Base.resource 

Test Setup        Start session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente
    [Tags]    smoke

    ${account}    Create Dictionary
    ...    name=Papito Fernando
    ...    email=papito@msn.com
    ...    cpf=94222077038

    Delete Account By Email    ${account}[email]

    Submit signup form    ${account}

    Verify welcome message

Tentativa pré-cadastro
    [Template]    Attempt signup
    ${EMPTY}    test@gmail.com    33032733081    Por favor informe o seu nome completo
    test        ${EMPTY}          33032733081    Por favor, informe o seu melhor e-mail
    test        test@gmail.com    ${EMPTY}       Por favor, informe o seu CPF
    test        test&gmail.com    33032733081    Oops! O email informado é inválido
    test        test*gmail.com    33032733081    Oops! O email informado é inválido
    test        www.test.com.br   33032733081    Oops! O email informado é inválido
    test        test@gmail.com    330327330      Oops! O CPF informado é inválido

*** Keywords ***
Attempt signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}

    ${account}    Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}

    Submit signup form    ${account}

    Notice should be      ${output_message}
