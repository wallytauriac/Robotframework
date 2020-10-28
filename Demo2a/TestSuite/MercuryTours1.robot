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
    #Open Browser    chrome://newtab/    ${BROWSER}
    Open Browser    ${URL}    ${BROWSER}
    Input Text    //input[@name="userName"]    demo
    Input Text    //input[@name="password"]    demo
    Click Element    //input[@name="login"]
    Select From List By Value    //select[@name="airline"]    Unified Airlines
    Click Element    //input[@name="findFlights"]
    Click Element    xpath=(//input[@name="outFlight"])[2]
    Click Element    //input[@name="reserveFlights"]
    Input Text    //input[@name="passFirst0"]    Wallace
    Input Text    //input[@name="passLast0"]    Tauriac
    Select From List By Value    //select[@name="creditCard"]    DS
    Input Text    //input[@name="creditnumber"]    123456789
    Select From List By Value    //select[@name="cc_exp_dt_mn"]    01
    Select From List By Value    //select[@name="cc_exp_dt_yr"]    2000
    Select From List By Value    //select[@name="cc_exp_dt_yr"]    2010
    Click Element    //input[@name="buyFlights"]
    Click Element    xpath=(//img)[11]

    Close Browser