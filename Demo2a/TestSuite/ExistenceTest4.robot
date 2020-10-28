*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://google.com
${browser}  chrome

*** Test Cases ***
Test Existence of website
    Start Test
    Sleep  3s
    End Test


*** Keywords ***
Start Test
    Open Browser  ${url}  ${browser}
    Log  ${url}
    Log  ${browser}

End Test
    Close Browser
