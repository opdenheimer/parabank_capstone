*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/login_user.robot
Resource    ../../resources/pages/OpenNewAcc_pages.robot
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/Transfer_funds_page.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC_E2E_03
    [Documentation]    This test case will perform an end-to-end test of the application, including user login, opening a new account and transferring funds between accounts.
    Log In With Valid Credentials
#    OPEN SAVINGS ACCOUNT
#    Set Suite Variable  ${Account_Id}   ${Saving_Account_Id}
#    Check Account Balance
#    OPEN CHECKING ACCOUNT
#    Set Suite Variable  ${current_account_id}    ${checking_account_Id}
    Transfer Funds With Account Creation
    Set Suite Variable    ${current_account_Id}  ${saving_account_number}
    Set Suite Variable    ${Account_Id}  ${checking_account_number}
    Login with API To get the token
    To Verify The Account Id Is Present
#    Transfer Funds Only
    Check Account Balance
    Set Suite Variable   ${dest_balance}   ${acc_balance}
    Log To Console    Destination Account Balance: ${dest_balance}

