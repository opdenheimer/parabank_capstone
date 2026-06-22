*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/login_user.robot
Resource    ../../resources/pages/OpenNewAcc_pages.robot
Resource    ../../resources/pages/Transfer_funds_page.robot
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup     Load Environment
Test Setup      Open Application
Test Teardown   Close Application

*** Test Cases ***
TC_API_06-Destination Balance Increased After Transfer
    [Documentation]    Verify the destination account balance increases by exactly the transfer amount (100)
    ...                after a UI fund transfer is completed.
    
    [Tags]    Functional

    #  UI – Login and open both accounts
    Log In With Valid Credentials
    OPEN CHECKING ACCOUNT
    OPEN SAVINGS ACCOUNT

    #  API – Login to get Customer ID 
    Login with API To get the token

    #  Point Account_Id to the Checking account (source of transfer)
    Set Suite Variable    ${src_account_id}    ${checking_account_Id}
    Log To Console    Source Account (Checking): ${src_account_id}
    Set Suite Variable    ${dest_account_id}    ${Saving_Account_Id}
    Log To Console    Destination Account (Saving): ${dest_account_id}
    
    # Capture destination balance BEFORE transfer via API
    Capture Destination Balance Before Transfer 

    #  UI – Transfer 100 from Checking → Savings 
    Transfer Funds Only

    #  API – Verify balance increased by exactly 100
    Verify Balance Increased By Exact Transfer Amount

