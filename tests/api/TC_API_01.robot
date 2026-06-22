*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC_API_01-Verify Customer account details
    [Documentation]  This test case will verify the customer account details [ID] using API
    [Tags]  Functional

    Login With API To Get The Token
    Get All Accounts Of Customer
    Set Suite Variable    ${current_account_id}    ${Account_id}
    To Verify The Account Id Is Present
