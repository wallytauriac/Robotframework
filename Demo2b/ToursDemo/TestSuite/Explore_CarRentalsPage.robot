*** Settings ***
Documentation     A test suite with a single test for Under Construction: Mercury Tours
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
Under Construction: Mercury Tours test
    Open Browser    http://www.newtours.demoaut.com/mercurywelcome.php    ${BROWSER}
    Click Link    //a[contains(text(),'Car Rentals')]
    Log Title
    Click Link    Link:Home
    Click Link    //a[contains(text(),'Car Rentals')]
    Click Link    Link:Flights
    Click Link    //a[contains(text(),'Car Rentals')]
    Click Link    Link:Hotels
    Click Link    //a[contains(text(),'Car Rentals')]
    Click Link    Link:Cruises
    Click Link    //a[contains(text(),'Car Rentals')]
    Click Link    //a[contains(text(),'Destinations')]
    Click Link    //a[contains(text(),'Car Rentals')]
    Click Link    //a[contains(text(),'Vacations')]
    Click Link    //a[contains(text(),'Car Rentals')]
    Click Link    Link:SIGN-ON
    Click Link    //a[contains(text(),'Car Rentals')]
    Click Link    Link:REGISTER
    Click Link    //a[contains(text(),'Car Rentals')]
    Click Link    //a[contains(text(),'SUPPORT')]
    Click Link    //a[contains(text(),'Car Rentals')]
    Click Link    //a[contains(text(),'CONTACT')]
    Click Link    //a[contains(text(),'Car Rentals')]
    Click Link    xpath=(//a[@href="mercurywelcome.php"])[2]

    Close Browser