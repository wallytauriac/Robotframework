*** Settings ***
Library  SeleniumLibrary
Resource  eBayVariables.robot

*** Keywords ***
Launch Browser
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

Stop Browser
    Close Browser
