*** Settings ***
Documentation     A test suite with a single test for Web Tours
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
Web Tours test
    Open Browser    http://localhost:1080/WebTours/    ${BROWSER}
    Input Text    //input[@name="username"]    demo
    Input Text    //input[@name="password"]    ***
    Click Element    //input[@name="login"]
    Click Element    xpath=(//img)[2]
    Click Element    //input[@name="removeAllFlights"]
    Click Element    xpath=(//img)[4]

    Close Browser