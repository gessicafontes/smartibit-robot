*** Settings ***
Documentation        Ações e elementos da tela de login

Library              AppiumLibrary

*** Keywords ***
SignIn with document
    [Arguments]        ${document}

    Input Text       
    ...    xpath=//android.widget.EditText[@resource-id="ipAddress"]    
    ...    26.237.140.81
    
    Input Text       
    ...    xpath=//android.widget.EditText[@resource-id="cpf"]          
    ...    ${document}

    Click Element    xpath=//android.widget.TextView[@text="Entrar"]