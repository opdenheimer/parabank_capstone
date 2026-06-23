*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${API_BASE_URL}    https://parabank.parasoft.com/parabank/services/bank
${USER_NAME}  john
${USER_PASSWORD}  demo


*** Keywords ***
Login with API To get the token
     [Documentation]    To login with api and get the token
    Create Session    banking_session    ${API_BASE_URL}  verify=${False}   headers={'Accept': 'application/json'}

    ${response}=  Get On Session    banking_session    /login/john/demo

    Should Be Equal As Integers    ${response.status_code}    200

    ${body}=  Set Variable    ${response.json()}
    Log To Console    ${body}
   ${customer_Id} =  Get From Dictionary    ${body}  id
    Set Suite Variable    ${Customer_Id}  ${customer_Id}


Get all Accounts of Customer
    [Documentation]    Getting all the accounts of a customer
#    Create Session    banking_session    ${API_BASE_URL}   verify=True  headers={"Accept": "application/json"}
    Create Session    banking_session    ${API_BASE_URL}   verify=${True}  headers={"Accept": "application/json"}
    ${response}=   GET On Session    banking_session    /customers/${Customer_Id}/accounts
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    "Status Code: ${response.status_code}"
    ${body}=    Set Variable    ${response.json()}
    Log To Console    ${body}
    ${account} =    Get From List   ${body}  0
    ${acc_Id}=    Get from Dictionary    ${account}  id
    ${current_account_type}=    Get from Dictionary    ${account}  type
    Set Suite Variable    ${current_account_type}  ${current_account_type}
    Set Suite Variable     ${Account_Id}   ${acc_Id}

To verify the Account Id is Present
    [Documentation]    Verify the account created via UI appears in the customer accounts list returned by the API

    Create Session    banking_session  ${API_BASE_URL}  verify=True  headers={"Accept":"application/json"}
    ${response}=  GET On Session    banking_session  /customers/${Customer_Id}/accounts
    Should Be Equal As Integers    ${response.status_code}  200
    Log To Console    Status Code:${response.status_code}
    ${body}=  Set Variable  ${response.json()}
    Log To Console    ${body}
    
    ${found}=  Set Variable    False
    
    FOR  ${account}  IN  @{body}
        
         ${acc_Id}=  Get From Dictionary    ${account}  id
         
         Log To Console    Found Account ID: ${acc_Id}
         
         IF  "${acc_Id}" == "${current_account_Id}"
             ${found}=  Set Variable    ${True}
             Log To Console    Account ID ${current_account_Id} found in the API response.
             Log To Console    Account ${current_account_Id} Verified Successfully
             BREAK
         END
    END

    Should Be True
    ...    ${found}
    ...    Account ${current_account_Id} not found in API response

Check Account type via Api
    [Documentation]    Verify the account type] of the created account via UI matches the account type returned by the API
#    Create Session    banking_session ${API_BASE_URL}  verify=True  headers={"Accept":"application/json"}
    Create Session    banking_session  ${API_BASE_URL}  verify=True  headers={"Accept":"application/json"}
    ${response}=  GET On Session    banking_session  /accounts/${Account_Id}
    Should Be Equal As Integers    ${response.status_code}  200
    Log To Console    Status Code:${response.status_code}
    ${body}=  Set Variable  ${response.json()}
    Log To Console    ${body}

    ${api_type}=  Get From Dictionary   ${body}   type
    Log To Console    Account Type from API: ${api_type}
    
    Should Not Be Empty    ${api_type}
    Should Be Equal    ${api_type}  ${Account_type}

    Log To Console    Account type verified
    
Check Account Balance 
    [Documentation]    To check account balance is Numeric and Non-Negative
    Create Session   banking_session  ${API_BASE_URL}  headers={"Accept":"application/json"}
    ${response}=  GET On Session    banking_session  /accounts/${Account_Id}
    Should Be Equal As Integers    ${response.status_code}  200
    
    ${body} =  Set Variable    ${response.json()}
    Log To Console   Accounts: ${body}
    
    ${acc_balance}=  Get From Dictionary    ${body}  balance
    Set Suite Variable    ${acc_balance}  ${acc_balance}
    Log To Console    acc_balance: ${acc_balance}
    IF  ${acc_balance}>=0
    Should Be True    ${acc_balance} >= 0    Account balance is negative: ${acc_balance}
    END
    IF  ${acc_balance}<0
        Log To Console   ${acc_balance} is negative
    END
    Log To Console    Account balance is ${acc_balance}

Check Reduced balance after Transfer
    [Documentation]    To check the balance is reduced by the transfer amount after a transfer is made from the account
    Create Session   banking_session  ${API_BASE_URL}  headers={"Accept":"application/json"}
    ${response}=  GET On Session    banking_session  /accounts/${Account_Id}
    Should Be Equal As Integers    ${response.status_code}  200

    ${body} =  Set Variable    ${response.json()}
    Log To Console   Accounts: ${body}

    ${acc_balance}=  Get From Dictionary    ${body}  balance
    Log To Console    acc_balance: ${acc_balance}

    Should Be True    ${acc_balance} < ${Initial_Balance}   Account balance did not reduce after transfer. Initial Balance: ${Initial_Balance}, Current Balance: ${acc_balance}

    Log To Console    Account balance reduced successfully after transfer. Current Balance: ${acc_balance}


Capture Source Balance Before Transfer
    [Documentation]    Captures the source account balance via API before a transfer is made.

    Create Session    banking_session    ${API_BASE_URL}    headers={"Accept":"application/json"}
    ${response}=    GET On Session    banking_session    /accounts/${src_account_id}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Status Code: ${response.status_code}
    Log To Console    Capturing source balance before transfer for Account ID: ${src_account_id}

    ${body}=    Set Variable    ${response.json()}
    Log To Console    Account Details: ${body}

    ${src_balance_before}=    Get From Dictionary    ${body}    balance
    Log To Console    Source Balance Before Transfer: ${src_balance_before}

    Set Suite Variable    ${src_balance_before}    ${src_balance_before}


Verify Balance Reduced By Exact Transfer Amount
    [Documentation]    Verifies the source account balance decreased by exactly 100 after a UI transfer.

    Create Session    banking_session1    ${API_BASE_URL}    headers={"Accept":"application/json"}
    ${response}=    GET On Session    banking_session1    /accounts/${src_account_id}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Status Code: ${response.status_code}

    ${body}=    Set Variable    ${response.json()}
    Log To Console    Account Details: ${body}

    ${src_balance_after}=    Get From Dictionary    ${body}    balance
    Log To Console    Source Balance After Transfer: ${src_balance_after}

    ${difference}=    Evaluate    ${src_balance_before} - ${src_balance_after}
    Log To Console    Balance Difference (Before - After): ${difference}

    Should Be Equal As Numbers    ${difference}    100
    ...    Balance did not reduce by exactly 100. Before: ${src_balance_before}, After: ${src_balance_after}, Difference: ${difference}

    Log To Console    PASS: Balance reduced from ${src_balance_before} to ${src_balance_after} — exact difference is 100


Verify Balance Increased By Exact Transfer Amount
    [Documentation]    Verifies the destination account balance increased by exactly 100 after a UI transfer.

    Create Session    banking_session1    ${API_BASE_URL}    headers={"Accept":"application/json"}
    ${response}=    GET On Session    banking_session1    /accounts/${dest_account_id}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Status Code: ${response.status_code}

    ${body}=    Set Variable    ${response.json()}
    Log To Console    Account Details: ${body}

    ${dest_balance_after}=    Get From Dictionary    ${body}    balance
    Log To Console    Destination Balance After Transfer: ${dest_balance_after}

    ${difference}=    Evaluate    ${dest_balance_after} - ${dest_balance_before}
    Log To Console    Balance Difference (After - Before): ${difference}

    Should Be Equal As Numbers    ${difference}    100
    ...    Balance did not reduce by exactly 100. Before: ${dest_balance_before}, After: ${dest_balance_after}, Difference: ${difference}

    Log To Console    PASS: Balance increased from ${dest_balance_before} to ${dest_balance_after} — exact difference is 100


Capture Destination Balance Before Transfer
    [Documentation]    Captures the destination account balance via API before a transfer is made.

    Create Session    banking_session    ${API_BASE_URL}    headers={"Accept":"application/json"}
    ${response}=    GET On Session    banking_session    /accounts/${dest_account_id}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Status Code: ${response.status_code}
    Log To Console    Capturing source balance before transfer for Account ID: ${dest_account_id}

    ${body}=    Set Variable    ${response.json()}
    Log To Console    Account Details: ${body}

    ${dest_balance_before}=    Get From Dictionary    ${body}    balance
    Log To Console    Source Balance Before Transfer: ${dest_balance_before}

    Set Suite Variable    ${dest_balance_before}    ${dest_balance_before}


Verify Transfer Debit Equals Credit
    [Documentation]    Re-fetches both accounts, computes debit and credit, and asserts they are equal to 100.
    
    # Fetch source account
    Create Session    banking_session    ${API_BASE_URL}    headers={"Accept":"application/json"}
    ${response_src}=    GET On Session    banking_session    /accounts/${src_account_id}
    Should Be Equal As Integers    ${response_src.status_code}    200
    ${body_src}=    Set Variable    ${response_src.json()}
    ${src_balance_after}=    Get From Dictionary    ${body_src}    balance
    Log To Console    Source Balance After Transfer: ${src_balance_after}

    # Fetch destination account
    ${response_dest}=    GET On Session    banking_session    /accounts/${dest_account_id}
    Should Be Equal As Integers    ${response_dest.status_code}    200
    ${body_dest}=    Set Variable    ${response_dest.json()}
    ${dest_balance_after}=    Get From Dictionary    ${body_dest}    balance
    Log To Console    Destination Balance After Transfer: ${dest_balance_after}

    # Compute debit and credit
    ${debit}=    Evaluate    ${src_balance_before} - ${src_balance_after}
    ${credit}=    Evaluate    ${dest_balance_after} - ${dest_balance_before}
    
    Log To Console    Debit: ${debit}, Credit: ${credit}
    
    # Assert
    Should Be Equal As Numbers    ${debit}    ${credit}    Debit (${debit}) does not equal Credit (${credit})
    Should Be Equal As Numbers    ${debit}    100          Debit is not 100
    
    Log To Console    PASS: Debit exactly equals Credit (${debit} == ${credit} == 100)

