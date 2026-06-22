*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/transfer_funds_e2e.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application
*** Test Cases ***
TC-TF-UI-02-Transfer Funds
    [Documentation]  This test case will transfer funds from one account to another
    [Tags]  Functional
    Log In With Valid Credentials
    Verify Transfer Funds
