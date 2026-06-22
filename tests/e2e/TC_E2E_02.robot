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
TC_E2E_02-Transfer via UI Debit Equals Credit via API
    [Documentation]    Verify the amount debited from the source exactly equals the amount credited to the destination.
    ...
    ...                Steps:
    ...                1. Login via UI and open a Checking account (source) and Savings account (destination)
    ...                2. Login via API to retrieve Customer ID
    ...                3. Record src_balance_before and dest_balance_before via API
    ...                4. Transfer 100 from source to destination via UI
    ...                5. Re-fetch both accounts from API
    ...                6. Compute debit and credit, assert debit == credit == 100
    [Tags]    Functional

    # Step 1: UI - Login and open both accounts
    Log In With Valid Credentials
    OPEN CHECKING ACCOUNT
    OPEN SAVINGS ACCOUNT

    # Step 2: API - Login to get Customer ID
    Login with API To get the token

    # Step 3: Record source and destination balances BEFORE transfer via API 
    Set Suite Variable    ${src_account_id}    ${checking_account_Id}
    Set Suite Variable    ${dest_account_id}    ${Saving_Account_Id}
    
    Capture Source Balance Before Transfer
    Capture Destination Balance Before Transfer

    # Step 4: UI - Transfer 100 from Checking to Savings
    Transfer Funds Only

    # Step 5 & 6: API - Compute and assert debit == credit == 100
    Verify Transfer Debit Equals Credit