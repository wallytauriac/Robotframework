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
    Input Text    //input[@name="password"]    demo
    Click Element    //input[@name="login"]
    Click Element    //img
    Select From List By Value    //select[@name="arrive"]    Paris
    Click Element    //input[@name="seatPref"]
    Click Element    //input[@name="findFlights"]
    Click Element    xpath=(//input[@name="outboundFlight"])[4]
    Click Element    //input[@name="reserveFlights"]
    Input Text    //input[@name="creditCard"]    1234567
    Input Text    //input[@name="expDate"]    12/23
    Click Element    //input[@name="buyFlights"]
    Click Element    xpath=(//b)[4]
    Click Element    xpath=(//img)[4]

    Close Browser