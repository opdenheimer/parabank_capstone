*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/Transfer_funds.robot
Resource    login_user.robot
Resource    OpenNewAcc_pages.robot

*** Keywords ***
Verify Transfer Funds
    [Documentation]    This keyword will verify the transfer of funds from one account to another

    Log To Console    Logged in successfully
    #Opening Checking Account
    Wait Until Element Is Visible    ${open_acc_link}    timeout=10s
    Click Element    ${open_acc_link}
    Log To Console    Opening a new checking account
    Wait Until Element Is Visible    ${select_acc_dropdown}   10s
    Click Element    ${select_acc_dropdown}
    Select From List By Label    ${select_acc_dropdown}    CHECKING
    Sleep    3s    # Wait for fromAccountId AJAX to populate
    Click Element    ${open_new_acc_btn}
    Log To Console    New checking account opened successfully
    Wait Until Element Is Visible    ${acc_id}    timeout=10s
    ${checking_account_number}=    Get Text    ${acc_id}
    Log To Console    Checking Account Number: ${checking_account_number}

#    OPEN SAVINGS ACCOUNT
    Wait Until Element Is Visible    ${open_acc_link}    timeout=10s
    Click Element    ${open_acc_link}
    Log To Console    Opening a new savings account
    Wait Until Element Is Visible    ${select_acc_dropdown}   10s
    Click Element    ${select_acc_dropdown}
    Select From List By Label    ${select_acc_dropdown}    SAVINGS
    Sleep    3s    # Wait for fromAccountId AJAX to populate
    Click Element    ${open_new_acc_btn}
    Log To Console    New savings account opened successfully
    Wait Until Element Is Visible    ${acc_id}    timeout=10s
    ${saving_account_number}=    Get Text    ${acc_id}
    Log To Console    Saving Account Number: ${saving_account_number}


    Wait Until Element Is Visible    ${transfer_funds_link}    timeout=10s
    Click Element    ${transfer_funds_link}
    Log To Console    Transferring funds from one account to another
    Wait Until Element Is Visible    ${from_acc_dropdown}   10s
    Wait Until Element Contains    ${from_acc_dropdown}    ${checking_account_number}    timeout=10s
    Click Element    ${from_acc_dropdown}
    Select From List By Label    ${from_acc_dropdown}    ${checking_account_number}
    
    Wait Until Element Is Visible    ${to_acc_dropdown}   10s
    Click Element    ${to_acc_dropdown}
    Select From List By Label    ${to_acc_dropdown}    ${saving_account_number}
    
    Input Text    ${amount_box}    100
    Click Element    ${transfer_btn}
    
    #verifying the transfer
    Wait Until Element Is Visible    ${amount_transferred}    timeout=10s
    ${amt_text}=    Get Text    ${amount_transferred}
    Log To Console    Amount Transferred: ${amt_text}
    
    Wait Until Element Is Visible    ${from_acc_transferred}    timeout=10s
    ${from_text}=    Get Text    ${from_acc_transferred}
    Log To Console    From Account : ${from_text}
    
    Wait Until Element Is Visible    ${to_acc_transferred}    timeout=10s
    ${to_text}=    Get Text    ${to_acc_transferred}
    Log To Console    To Account : ${to_text}
    
    Log To Console    Funds transferred successfully
