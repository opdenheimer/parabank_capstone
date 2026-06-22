*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/login_locators.robot
Resource    ../../variables/Transfer_funds.robot

Load Environment

*** Test Cases ***
Investigate Negative Transfer
