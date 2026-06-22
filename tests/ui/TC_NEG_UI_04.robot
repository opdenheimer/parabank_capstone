*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/Transfer_funds_page.robot
Resource    ../../resources/pages/login_user.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-NEG-UI-03-Invalid Transfer
    [Documentation]  This test case will verify the system rejects a negative value entered in the transfer amount field
    [Tags]  Negative

    Log In With Valid Credentials
    Transfer Funds With Zero Amount