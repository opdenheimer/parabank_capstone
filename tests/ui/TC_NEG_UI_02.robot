*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/invalid_login.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-NEG-UI-02-Invalid Login
    [Documentation]  This test case will verify the login functionality with invalid credentials
    [Tags]  Negative

    Logging In with wrong credentials
