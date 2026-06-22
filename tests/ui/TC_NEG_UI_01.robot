*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/invalid_registration.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-NEG-UI-01-Invalid Registration
    [Documentation]  This test case will verify the registration functionality with invalid credentials
    [Tags]  Negative

    Register User without Credentials

