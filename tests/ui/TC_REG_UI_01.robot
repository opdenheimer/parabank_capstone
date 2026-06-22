*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/register_user.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-REG-UI-01-Register User with valid Credentials
    [Documentation]  This test case will register a new user with valid credentials
    [Tags]  Functional

    Register User with valid Credentials
