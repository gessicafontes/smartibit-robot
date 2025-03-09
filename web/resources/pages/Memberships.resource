*** Settings ***
Documentation        Ações e elementos da página de matrículas

Library        Browser

*** Keywords ***
Create New Memberships
    [Arguments]    ${data}

    Go to Memberships Form

    Select Account    ${data}[account][name]    ${data}[account][cpf]
    
    Select Plan    ${data}[plan][name]

    Fill Payment Card  ${data}[credit_card]

    Click    css=button[type=submit] >> text=Cadastrar
Go to Memberships Form
    Click    css=a[href="/memberships/new"]

    Wait For Elements State    css=h1 >> text=Nova matrícula
    ...     visible    5

Select Account
    [Arguments]    ${name}    ${cpf}

    Fill Text    css=input[aria-label="select_account"]    ${name}
    Click    css=[data-testid="${cpf}"]

Select Plan
    [Arguments]    ${plan_name}

    Fill Text    css=input[aria-label=select_plan]    ${plan_name}
    Click    css=div[class*=option] >> text=${plan_name}

Fill Payment Card
    [Arguments]    ${card}

    Fill Text    css=input[name=card_number]    ${card}[number]
    Fill Text    css=input[name=card_holder]    ${card}[holder]
    Fill Text    css=input[name=card_month]     ${card}[month]
    Fill Text    css=input[name=card_year]      ${card}[year]
    Fill Text    css=input[name=card_cvv]       ${card}[cvv]

Search by name
    [Arguments]    ${name}

    Fill Text    css=input[placeholder^="Busque"]    ${name}

    Wait For Elements State    css=strong >> text=Total: 1
    ...    visible    5

Should filter by name
    [Arguments]    ${name}
    
    Wait For Elements State    css=table tbody tr >> text=${name}
    ...    visible    5

Request removal
    [Arguments]    ${name}

    Click    xpath=//td[text()="${name}"]/..//button

Membership should not be visible
    [Arguments]    ${name}

    Wait For Elements State    css=table tbody tr >> text=${name}
    ...    detached    5
