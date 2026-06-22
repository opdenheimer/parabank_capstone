*** Settings ***
Library  SeleniumLibrary
Resource    ../../variables/invalid_login_locators.robot

*** Keywords ***
Logging In with wrong credentials
    [Documentation]  This test case will attempt to log in with invalid credentials
    [Tags]  Functional
    Wait Until Element Is Visible        ${login_btn}    timeout=10s
    Input Text    ${username_login}    wronguser
    Input Text    ${password_login}    wrongpass
    Click Element    ${login_btn}
    Wait Until Element Is Visible    ${username_verification}    timeout=10s
    Page Should Contain Element    ${username_verification}

    Log To Console   User login failed due to invalid credentials