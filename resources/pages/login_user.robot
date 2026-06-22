*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/login_locators.robot

*** Keywords ***
Log In With Valid Credentials
  [Documentation]    This keyword will login to the application with valid credentials
  Wait Until Element Is Visible    ${username_login}    timeout=10s
  Click Element    ${username_login}
  Input Text    ${username_login}    john
  Click Element    ${password_login}
  Input Text    ${password_login}    demo
  Wait Until Element Is Visible    ${login_btn}
  Click Element    ${login_btn}
  Log To Console    Logging In
  Wait Until Element Is Visible    ${Welcome}  10s
  Log To Console    Welcome User
  Page Should Contain    Welcome
  