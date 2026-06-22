*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/OpenNewAcc_pages.robot
Resource    ../../resources/pages/login_user.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC_API_02-Verify the account created via UI appears in the customer accounts list returned by the API.
    [Documentation]  This test case will verify the customer account details with valid ID using API
    [Tags]  Functional

    Log In With Valid Credentials
    OPEN SAVINGS ACCOUNT
    Set Suite Variable    ${current_account_id}    ${Saving_Account_id}
    #api keywords
    Login with API To get the token
    To verify the Account Id is Present

