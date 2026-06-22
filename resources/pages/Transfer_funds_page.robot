*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/Transfer_funds.robot
Resource    OpenNewAcc_pages.robot

*** Keywords ***
Transfer Funds with account creation
    [Documentation]    This keyword will transfer funds from one account to another
    #Opening Checking Account
    Wait Until Element Is Visible    ${open_acc_link}    timeout=10s
    Click Element    ${open_acc_link}
    Log To Console    Opening a new checking account
    Wait Until Element Is Visible    ${select_acc_dropdown}   10s
    Click Element    ${select_acc_dropdown}
    Select From List By Label    ${select_acc_dropdown}    CHECKING
    Sleep    3s
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
    Sleep    3s
    Click Element    ${open_new_acc_btn}
    Log To Console    New savings account opened successfully
    Wait Until Element Is Visible    ${acc_id}    timeout=20s
    ${saving_account_number}=    Get Text    ${acc_id}
    Log To Console    Saving Account Number: ${saving_account_number}


    Wait Until Element Is Visible    ${transfer_funds_link}    timeout=10s

    Click Element    ${transfer_funds_link}
    Log To Console    Transferring funds from one account to another
    Wait Until Element Is Visible    ${amount_box}   20s
    Input Text    ${amount_box}    100
    Wait Until Element Is Visible    ${from_acc_dropdown}   10s
    Wait Until Element Contains    ${from_acc_dropdown}    ${checking_account_number}    timeout=10s
    Click Element    ${from_acc_dropdown}
    Select From List By Label    ${from_acc_dropdown}    ${checking_account_number}

    Wait Until Element Is Visible    ${to_acc_dropdown}   10s
    Click Element    ${to_acc_dropdown}

    Select From List By Label    ${to_acc_dropdown}    ${saving_account_number}

    Wait Until Element Is Visible    ${transfer_btn}   10s
    Click Element    ${transfer_btn}
    Log To Console    Funds transferred successfully

Transfer Funds Only
    [Documentation]    This keyword will transfer funds from one account to another
    Wait Until Element Is Visible    ${transfer_funds_link}    timeout=10s
    Click Element    ${transfer_funds_link}
    Log To Console    Transferring funds from one account to another
    Wait Until Element Is Visible    ${amount_box}   20s
    Input Text    ${amount_box}    100

    Wait Until Element Is Visible    ${from_acc_dropdown}   10s
    Wait Until Element Contains    ${from_acc_dropdown}    ${src_account_id}    timeout=10s
    Click Element    ${from_acc_dropdown}
    Select From List By Label    ${from_acc_dropdown}    ${src_account_id}

    Wait Until Element Is Visible    ${to_acc_dropdown}   10s
    Click Element    ${to_acc_dropdown}
    Sleep    2s
    Select From List By Label    ${to_acc_dropdown}    ${dest_account_id}

   Wait Until Element Is Visible    ${transfer_btn}   10s
    Click Element    ${transfer_btn}
    Log To Console    Funds transferred successfully

Invalid Transfer Funds
    [Documentation]    This keyword will transfer negative funds from one account to another
    #Opening Checking Account
    Wait Until Element Is Visible    ${open_acc_link}    timeout=10s
    Click Element    ${open_acc_link}
    Log To Console    Opening a new checking account
    Wait Until Element Is Visible    ${select_acc_dropdown}   10s
    Click Element    ${select_acc_dropdown}
    Select From List By Label    ${select_acc_dropdown}    CHECKING
    Sleep    3s
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
    Sleep    3s
    Click Element    ${open_new_acc_btn}
    Log To Console    New savings account opened successfully
    Wait Until Element Is Visible    ${acc_id}    timeout=20s
    ${saving_account_number}=    Get Text    ${acc_id}
    Log To Console    Saving Account Number: ${saving_account_number}


    Wait Until Element Is Visible    ${transfer_funds_link}    timeout=10s

    Click Element    ${transfer_funds_link}
    Log To Console    Transferring funds from one account to another
    Wait Until Element Is Visible    ${amount_box}   20s
    Input Text    ${amount_box}    -100
    Wait Until Element Is Visible    ${from_acc_dropdown}   10s
    Wait Until Element Contains    ${from_acc_dropdown}    ${checking_account_number}    timeout=10s
    Click Element    ${from_acc_dropdown}
    Select From List By Label    ${from_acc_dropdown}    ${checking_account_number}

    Wait Until Element Is Visible    ${to_acc_dropdown}   10s
    Click Element    ${to_acc_dropdown}

    Select From List By Label    ${to_acc_dropdown}    ${saving_account_number}

    Wait Until Element Is Visible    ${transfer_btn}   10s
    Click Element    ${transfer_btn}
    Log To Console    Negative Funds should not be transferred successfully

Transfer Funds with Zero Amount
    [Documentation]    This keyword will transfer negative funds from one account to another
    #Opening Checking Account
    Wait Until Element Is Visible    ${open_acc_link}    timeout=10s
    Click Element    ${open_acc_link}
    Log To Console    Opening a new checking account
    Wait Until Element Is Visible    ${select_acc_dropdown}   10s
    Click Element    ${select_acc_dropdown}
    Select From List By Label    ${select_acc_dropdown}    CHECKING
    Sleep    3s
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
    Sleep    3s
    Click Element    ${open_new_acc_btn}
    Log To Console    New savings account opened successfully
    Wait Until Element Is Visible    ${acc_id}    timeout=20s
    ${saving_account_number}=    Get Text    ${acc_id}
    Log To Console    Saving Account Number: ${saving_account_number}


    Wait Until Element Is Visible    ${transfer_funds_link}    timeout=10s

    Click Element    ${transfer_funds_link}
    Log To Console    Transferring funds from one account to another
    Wait Until Element Is Visible    ${amount_box}   20s
    Input Text    ${amount_box}    0
    Log To Console    Transferring zero amount
    Wait Until Element Is Visible    ${from_acc_dropdown}   10s
    Wait Until Element Contains    ${from_acc_dropdown}    ${checking_account_number}    timeout=10s
    Click Element    ${from_acc_dropdown}
    Select From List By Label    ${from_acc_dropdown}    ${checking_account_number}

    Wait Until Element Is Visible    ${to_acc_dropdown}   10s
    Click Element    ${to_acc_dropdown}

    Select From List By Label    ${to_acc_dropdown}    ${saving_account_number}

    Wait Until Element Is Visible    ${transfer_btn}   10s
    Click Element    ${transfer_btn}
    Log To Console    Zero Amount should not be transferred successfully
