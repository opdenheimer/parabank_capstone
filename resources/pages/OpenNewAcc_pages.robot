*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/OpenNewAcc.robot

*** Keywords ***
OPEN CHECKING ACCOUNT
    [Documentation]    This keyword will open a new checking account
    Wait Until Element Is Visible    ${open_acc_link}    timeout=10s
    Click Element    ${open_acc_link}
    Log To Console    Opening a new checking account
    Wait Until Element Is Visible    ${select_acc_dropdown}   10s
    Click Element    ${select_acc_dropdown}
    Select From List By Label    ${select_acc_dropdown}    CHECKING
    Wait Until Element Is Enabled    ${open_new_acc_btn}  20s
    Sleep    2s
    Click Element    ${open_new_acc_btn}
    Log To Console    New checking account opened successfully
    Wait Until Element Is Visible    ${acc_id}    timeout=20s
    Sleep  2s
    ${checking_account_number}=    Get Text    ${acc_id}
   Set Suite Variable    ${checking_account_Id}  ${checking_account_number}
    Page Should Contain    Congratulations, your account is now open.

OPEN SAVINGS ACCOUNT
    [Documentation]    This keyword will open a new savings account

    Wait Until Element Is Visible    ${open_acc_link}    timeout=10s
    Click Element    ${open_acc_link}
    Log To Console    Opening a new savings account
    Wait Until Element Is Visible    ${select_acc_dropdown}   10s
    Click Element    ${select_acc_dropdown}
    Select From List By Label    ${select_acc_dropdown}    SAVINGS
    Wait Until Element Is Enabled    ${open_new_acc_btn}  20s
    Sleep    2s
    Click Element    ${open_new_acc_btn}
    Log To Console    New savings account opened successfully
    Wait Until Element Is Visible    ${acc_id}    timeout=20s
    Sleep  3s
    ${Saving_account_number}=    Get Text    ${acc_id}
    Log To Console    Saving Account Number: ${Saving_account_number}
    Set Suite Variable    ${Saving_Account_Id}    ${Saving_account_number}
    Page Should Contain    Congratulations, your account is now open.
