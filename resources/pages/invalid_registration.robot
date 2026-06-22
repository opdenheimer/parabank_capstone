*** Settings ***
Library  SeleniumLibrary
Resource    ../../variables/register_locators.robot
Resource    ../../variables/invalid_registration_locators.robot

*** Keywords ***
Register User without Credentials
    [Documentation]  This test case will register a new user with valid credentials
    [Tags]  Functional
    Wait Until Element Is Visible        ${register_btn}    timeout=10s
     Click Element    ${register_btn}
     Click Element    ${register_submit_btn}
     Page Should Contain Element    ${invalid_first_name}
     Page Should Contain Element    ${invalid_last_name}
     Page Should Contain Element    ${invalid_address}
     Page Should Contain Element    ${invalid_city}
     Page Should Contain Element    ${invalid_state}
     Page Should Contain Element    ${invalid_zip_code}
     Page Should Contain Element    ${invalid_ssn}
     Page Should Contain Element    ${invalid_username}
     Page Should Contain Element    ${invalid_password}
     Page Should Contain Element    ${invalid_confirm_password}
     
     Log To Console   User registration failed due to missing credentials