*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/login_user.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application
*** Test Cases ***
TC-LOGIN-UI-01-Login User with valid Credentials
    [Documentation]  This test case will login a user with valid credentials
    [Tags]  Functional

    Log In With Valid Credentials
