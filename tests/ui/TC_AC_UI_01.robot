*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/OpenNewAcc_pages.robot
Resource    ../../resources/pages/login_user.robot
Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application
*** Test Cases ***
TC_AC_UI_01-Open Savings Account
    [Documentation]  This test case will open a new Savings account for the user
    [Tags]  Functional
    Log In With Valid Credentials
    OPEN SAVINGS ACCOUNT
