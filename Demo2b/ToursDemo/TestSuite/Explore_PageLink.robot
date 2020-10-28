*** Settings ***
Documentation     A test suite with a single test for Welcome: Mercury Tours
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
Welcome: Mercury Tours test
    Open Browser    http://www.newtours.demoaut.com/mercurywelcome.php    ${BROWSER}
    Click Link    Link:SIGN-ON
    Click Link    Link:REGISTER
    Log Title
    Click Link    //a[contains(text(),'SUPPORT')]
    Click Link    xpath=(//a[@href="mercurywelcome.php"])[2]  #RETURN
    Click Link    //a[contains(text(),'CONTACT')]

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

    Close Browser