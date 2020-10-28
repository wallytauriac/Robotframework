*** Settings ***
Documentation     A test suite with a single test for Web Tours
...               Created by hats' Robotcorder
Library           Selenium2Library    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
Web Tours test
    Open Browser    http://localhost:1080/WebTours/    ${BROWSER}
    Input Text    //input[@name="username"]    demo
    Input Text    //input[@name="password"]    ***
    Click Element    //input[@name="login"]
    Click Element    //img
    Click Element    xpath=(//img)[2]
    Click Element    xpath=(//img)[3]
    Click Element    xpath=(//img)[4]

    Close Browser