*** Settings ***
Library  SeleniumLibrary
Library  ../../config/environment.py

*** Variables ***
${BROWSER}  chrome
${ENV}  qa

*** Keywords ***
Load Environment
    Load Env    ${ENV}
    ${url}=  Get Env    baseurl
    ${phone_no}=  Get Env    ph_no
    ${username}=  Get Env    user_name
    ${pwd}=  Get Env    user_password

    Set Global Variable    ${BASE_URL}  ${url}
    Set Global Variable    ${PHONE_NO}  ${phone_no}
    Set Global Variable    ${USER_NAME}  ${username}
    Set Global Variable    ${USER_PWD}  ${pwd}

Open Application
    [Documentation]  Opens the application
    Open Browser  ${BASE_URL}  ${BROWSER}
    Maximize Browser Window

Close Application
    [Documentation]  Closing the application
    Close All Browsers
