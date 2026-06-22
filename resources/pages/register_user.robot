*** Settings ***
Library  SeleniumLibrary
Resource    ../../variables/register_locators.robot

*** Keywords ***
Register User with valid Credentials
    [Documentation]  This test case will register a new user with valid credentials
    [Tags]  Functional
    Wait Until Element Is Visible        ${register_btn}    timeout=10s
     Click Element    ${register_btn}
     Input Text    ${first_name}    John
     Input Text    ${last_name}    Doe
     Input Text    ${address}  123 Main St
     Input Text    ${city}    New York
     Input Text    ${state}    NY
     Input Text    ${zip_code}    100011
     Input Text    ${phone}    0985342442
     Input Text    ${ssn}    32322
     Input Text    ${username_txt}    granny
     Input Text    ${password_txt}    demo
     Input Text    ${confirm_password_txt}    demo
     Click Element    ${register_submit_btn}
     Wait Until Element Is Visible    ${greeting_msg}    timeout=10s
     Page Should Contain    Your account was created successfully. You are now logged in.
     Log To Console   User registered successfully
