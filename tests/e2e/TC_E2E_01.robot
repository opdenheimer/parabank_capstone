*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/login_user.robot
Resource    ../../resources/pages/OpenNewAcc_pages.robot
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC_E2E_01
    [Documentation]    This test case will perform an end-to-end test of the application, including user registration, login, and opening a new account.
    Log In With Valid Credentials
    OPEN SAVINGS ACCOUNT
    Set Suite Variable  ${current_account_Id}   ${Saving_Account_Id}
    Login with API To get the token
    To Verify The Account Id Is Present


