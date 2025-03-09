*** Settings ***
Documentation        Arquivo principal do projeto Robot

Library        JSONLibrary
Library        Browser
Library        ../../libs/Account.py
Library        ../../libs/Database.py

Resource       ./pages/Landing.resource
Resource       ./pages/Welcome.resource
Resource       ./pages/Login.resource
Resource       ./pages/Accounts.resource
Resource       ./pages/Memberships.resource

Resource       ./pages/Components/Toast.resource
Resource       ./pages/Components/BoxNotice.resource
Resource       ./pages/Components/Navbar.resource
Resource       ./pages/Components/Modal.resource

Variables      Env.py

*** Variables ***
${ADMIN_EMAIL}    sac@smartbit.com
${ADMIN_PASS}     pwd123

*** Keywords ***

Start session
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Page    ${BASE_URL}

Get JSON fixture
    [Arguments]        ${file_name}    ${scenario}

    ${data}    
    ...    Load Json From File    
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=utf-8

    RETURN   ${data}[${scenario}]
SignIn Admin    
    Go to login page
    Submit login form    ${ADMIN_EMAIL}    ${ADMIN_PASS}

    User is logged in    ${ADMIN_EMAIL}
