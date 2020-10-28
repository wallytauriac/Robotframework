*** Settings ***
Documentation     A test suite with a single test for Welcome: Mercury Tours
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10
Library           Screenshot
Library           ScreenCapLibrary

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
Welcome: Mercury Tours test
    Open Browser    http://newtours.demoaut.com/mercurywelcome.php    ${BROWSER}
    Log Title
    #Welcome Page
    Click Element    xpath=(//b)[6]   #Current date value display
    Input Text    //input[@name="userName"]    demo
    Input Text    //input[@name="password"]    demo
    Click Element    //input[@name="login"]
    #Reservation Page 1
    Log Title
    Select From List By Value    //select[@name="passCount"]    1
    Select From List By Value    //select[@name="fromPort"]    Acapulco
    Select From List By Value    //select[@name="fromMonth"]    6
    Select From List By Value    //select[@name="fromDay"]    28
    Select From List By Value    //select[@name="toPort"]    Acapulco
    Select From List By Value    //select[@name="toMonth"]    6
    Select From List By Value    //select[@name="toDay"]    28
    Click Element    //input[@name="servClass"]     #Economy Class
    Select From List By Index    //select[@name="airline"]    2
    Click Element    //input[@name="findFlights"]
    #Reservation Page 2
    Log Title
    Click Element    xpath=(//input[@name="outFlight"])[4]
    Click Element    xpath=(//input[@name="inFlight"])[4]
    Click Element    //input[@name="reserveFlights"]
    Input Text    //input[@name="passFirst0"]    Walter
    Input Text    //input[@name="passLast0"]    Tauren
    Input Text    //input[@name="creditnumber"]    1234345567
    Select From List By Index    //select[@name="cc_exp_dt_mn"]    1
    Select From List By Index    //select[@name="cc_exp_dt_yr"]    11
    Input Text    //input[@name="cc_frst_name"]    Wallace
    Input Text    //input[@name="cc_last_name"]    Tauriac
    Input Text    //input[@name="billAddress1"]    123 Enchanted Trail Drive
    Input Text    //input[@name="billCity"]    Spring
    Input Text    //input[@name="billState"]    TX
    Input Text    //input[@name="billZip"]    77388
    Click Element    //input[@name="buyFlights"]
    #Reservation Page 3
    Log Title
    Screenshot.Set Screenshot Directory  ../Results
    ScreenCapLibrary.Take Screenshot    name=screenshot  format=png  quality=0
    Click Element    xpath=(//img)[10]
    Click Link    //a[@href="mercurysignoff.php"]

    Close Browser