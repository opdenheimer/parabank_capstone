*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot


*** Test Cases ***
TC-API-03 Verify Account Type

    [Documentation]    Verify the type field returned by the single-account endpoint matches what was selected during account creation
    [Tags]    Functional
    Login With API To Get The Token
    Get all Accounts Of Customer
    Set Suite Variable    ${Account_type}  ${current_account_type}
    Check Account type via Api
