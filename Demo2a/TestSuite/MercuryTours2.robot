*** Settings ***
Documentation     A test suite with a single test for New Tab
...               Created by hats' Robotcorder
Library           Selenium2Library    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3
${URL}  http://newtours.demoaut.com

*** Test Cases ***
New Tab test
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Page Contains Element    //input[@name="userName"]
    Input Text    //input[@name="userName"]    demo
    Wait Until Page Contains Element    //input[@name="password"]
    Input Text    //input[@name="password"]    demo
    Wait Until Page Contains Element    //input[@name="login"]
    Click Element    //input[@name="login"]
    Wait Until Page Contains Element    //select[@name="airline"]
    Select From List By Value    //select[@name="airline"]    Unified Airlines
    Wait Until Page Contains Element    //input[@name="findFlights"]
    Click Element    //input[@name="findFlights"]
    Wait Until Page Contains Element    xpath=(//input[@name="outFlight"])[2]
    Click Element    xpath=(//input[@name="outFlight"])[2]
    Wait Until Page Contains Element    //input[@name="reserveFlights"]
    Click Element    //input[@name="reserveFlights"]
    Wait Until Page Contains Element    //input[@name="passFirst0"]
    Input Text    //input[@name="passFirst0"]    Wallace
    Wait Until Page Contains Element    //input[@name="passLast0"]
    Input Text    //input[@name="passLast0"]    Tauriac
    Wait Until Page Contains Element    //select[@name="creditCard"]
    Select From List By Value    //select[@name="creditCard"]    DS
    Wait Until Page Contains Element    //input[@name="creditnumber"]
    Input Text    //input[@name="creditnumber"]    123456789
    Wait Until Page Contains Element    //select[@name="cc_exp_dt_mn"]
    Select From List By Value    //select[@name="cc_exp_dt_mn"]    01
    Wait Until Page Contains Element    //select[@name="cc_exp_dt_yr"]
    Select From List By Value    //select[@name="cc_exp_dt_yr"]    2000
    Wait Until Page Contains Element    //select[@name="cc_exp_dt_yr"]
    Select From List By Value    //select[@name="cc_exp_dt_yr"]    2010
    Wait Until Page Contains Element    //input[@name="buyFlights"]
    Click Element    //input[@name="buyFlights"]
    Wait Until Page Contains Element    xpath=(//img)[11]
    Click Element    xpath=(//img)[11]

    Close Browser