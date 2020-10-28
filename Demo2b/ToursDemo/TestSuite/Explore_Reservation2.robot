*** Settings ***
Documentation     A test suite with a single test for Select a Flight: Mercury Tours
...               Created by hats' Robotcorder
Library           Selenium2Library    timeout=10

Suite Setup    Open Browser    http://newtours.demoaut.com/mercurywelcome.php    ${BROWSER}
*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
Login Test
    Mercury Tours Login

Select a Flight: Mercury Tours test 2
    #Open Browser    http://newtours.demoaut.com/mercuryreservation2.php    ${BROWSER}
    #Wait Until Page Contains Element  //input[@name="tripType"]
    Log Title
    #Left panel links
    #Click Link    //a[@href="mercurywelcome.php"]
    #Click Link    //a[@href="mercuryreservation.php"]
    #Click Link    //a[@href="mercuryunderconst.php"]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[2]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[3]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[4]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[5]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[6]
    #Top panel links
    #Click Link    //a[@href="mercurysignoff.php"]
    #Mercury Tours Login

    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[7]
    #Click Link    //a[@href="mercuryregister.php"]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[8]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[9]
    #Reservation page 2
    Click Element    //input[@name="outFlight"]  # Out flight radio button
    Click Element    xpath=(//input[@name="outFlight"])[2]
    Click Element    xpath=(//input[@name="outFlight"])[3]
    Click Element    xpath=(//input[@name="outFlight"])[4]
    Click Element    //input[@name="inFlight"]  # In flight radio button
    Click Element    xpath=(//input[@name="inFlight"])[2]
    Click Element    xpath=(//input[@name="inFlight"])[3]
    Click Element    xpath=(//input[@name="inFlight"])[4]
    Click Element    Name:reserveFlights
    Click Link    //a[@href="mercurysignoff.php"]  #Log out
    Close Browser

*** Keywords ***
Mercury Tours Login

    Input Text    //input[@name="userName"]    demo
    Input Password    //input[@name="password"]    demo
    Click Element    //input[@name="login"]
    Click Element    //input[@name="tripType"]
    Click Element    Name:findFlights  #Continue to page 2