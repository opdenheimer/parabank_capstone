*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/Transfer_funds_page.robot
Resource    ../../resources/pages/login_user.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application
*** Test Cases ***
TC_TF_UI_01_Transfer Funds
    [Documentation]  This test case will transfer funds from one account to another
    [Tags]  Functional
    Log In With Valid Credentials
    Transfer Funds With Account Creation