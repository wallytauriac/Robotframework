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
    Sleep  2s
    Select From List By Value    //select[@name="fromPort"]    New York
    Select From List By Value    //select[@name="toPort"]    Seattle
    Select From List By Label    //select[@name="airline"]    Unified Airlines
    Click Element    //input[@name="findFlights"]
    Click Link    //a[@href="mercurysignoff.php"]
    Close Browser