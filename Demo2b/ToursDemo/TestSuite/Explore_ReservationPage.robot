*** Settings ***
Documentation     A test suite with a single test for Find a Flight: Mercury Tours:
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10

Suite Setup    Open Browser    http://newtours.demoaut.com/mercurywelcome.php    ${BROWSER}
*** Variables ***
${BROWSER}    chrome
${SLEEP}    3
${URL}      http://newtours.demoaut.com/mercuryreservation.php

*** Test Cases ***
Login Test
    Mercury Tours Login

Find a Flight: Mercury Tours test 1
    #Open Browser   ${URL}     ${BROWSER}

    Wait Until Page Contains Element  //input[@name="tripType"]
    Log Title
    #Left panel links
    #Click Link    //a[@href="mercurywelcome.php"]
    #Click Link    //a[@href="mercuryreservation.php"]
    #Click Link    //a[@href="mercuryunderconst.php"]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[2]
    #Click Link    //a[@href="mercurycruise.php"]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[3]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[4]
    #Top panel links
    Click Link    //a[@href="mercurysignoff.php"]
    Mercury Tours Login
    #Click Link    //a[@href="mercuryitinerary.php"]
    #Click Link    //a[@href="mercuryprofile.php"]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[5] #Support
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[6] #Contact
    # Reservation page 1
    Click Element    //input[@name="tripType"]
    Click Element    xpath=(//input[@name="tripType"])[2]
    Select From List By Value    //select[@name="passCount"]    1
    Select From List By Value    //select[@name="fromPort"]    Acapulco
    Select From List By Value    //select[@name="fromMonth"]    6
    Select From List By Value    //select[@name="fromDay"]    28
    Select From List By Value    //select[@name="toPort"]    Acapulco
    Select From List By Value    //select[@name="toMonth"]    6
    Select From List By Value    //select[@name="toDay"]    28
    Click Element    //input[@name="servClass"]     #Economy Class
    Click Element    xpath=(//input[@name="servClass"])[2]  #Business Class
    Click Element    xpath=(//input[@name="servClass"])[3]  #First Class
    Select From List By Index    //select[@name="airline"]    0
    @{airlines}=  Get List Items  //select[@name="airline"]
    Click Link    //a[@href="mercurysignoff.php"]
    #Click Element    //input[@name="findFlights"]

    Close Browser

*** Keywords ***
Mercury Tours Login

    Input Text    //input[@name="userName"]    demo
    Input Password    //input[@name="password"]    demo
    Click Element    //input[@name="login"]
    Click Element    //input[@name="tripType"]