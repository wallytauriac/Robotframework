*** Settings ***
Documentation     A test suite with a single test for Under Construction: Mercury Tours
...               Created by hats' Robotcorder
Library           Selenium2Library    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3
${URL}  http://www.newtours.demoaut.com/mercurywelcome.php

*** Test Cases ***
Under Construction: Mercury Tours test
    Open Browser   ${URL}     ${BROWSER}
    Click Link    Link:Hotels
    Click Link    Link:Home
    Click Link    Link:Flights
    Click Link    Link:Hotels
    Click Link    xpath=(//a[@href="mercurywelcome.php"])[2]  #RETURN
    Click Link    //a[contains(text(),'Car Rentals')]
    Click Link    xpath=(//a[@href="mercurywelcome.php"])[2]  #RETURN
    Click Link    Link:Cruises
    Click Link    xpath=(//a[@href="mercurywelcome.php"])  #RETURN
    Click Link    //a[contains(text(),'Destinations')]
    Click Link    xpath=(//a[@href="mercurywelcome.php"])[2]  #RETURN
    Click Link    //a[contains(text(),'Vacations')]
    Click Link    xpath=(//a[@href="mercurywelcome.php"])[2]  #RETURN
    Click Link    Link:SIGN-ON
    Click Link    Link:REGISTER
    Click Link    //a[contains(text(),'SUPPORT')]
    Click Link    //a[contains(text(),'CONTACT')]
    Click Link    xpath=(//a[@href="mercurywelcome.php"])[2]  #RETURN

    Close Browser