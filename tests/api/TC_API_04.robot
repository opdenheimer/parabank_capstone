*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot


*** Test Cases ***
TC-API-04-To Verify Account Balance
    [Documentation]  This test case will verify the account balance is numeric as well as non zero
    [Tags]  Functional
    Login with API To get the token
    Get all Accounts of Customer
    Check Account Balance

