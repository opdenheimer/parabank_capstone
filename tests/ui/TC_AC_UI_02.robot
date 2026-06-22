*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/OpenNewAcc_pages.robot
Resource    ../../resources/pages/login_user.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application
*** Test Cases ***
TC_AC_UI_02-Open New Checking Account
    [Documentation]  This test case will open a new checking account for the user
    [Tags]  Functional
    Log In With Valid Credentials
    OPEN CHECKING ACCOUNT
