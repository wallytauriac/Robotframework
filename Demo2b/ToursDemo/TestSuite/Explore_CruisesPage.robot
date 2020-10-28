*** Settings ***
Documentation     A test suite with a single test for Cruises: Mercury Tours
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
Cruises: Mercury Tours test
    Open Browser    http://www.newtours.demoaut.com/mercurywelcome.php    ${BROWSER}
    Click Link    Link:Cruises
    Log Title
    Click Link    Link:Home
    Click Link    Link:Cruises
    Click Link    Link:Flights
    Click Link    Link:Cruises
    Click Link    Link:Hotels
    Click Link    Link:Cruises
    Click Link    //a[contains(text(),'Car Rentals')]
    Click Link    Link:Cruises
    Click Link    //a[contains(text(),'Destinations')]
    Click Link    Link:Cruises
    Click Link    //a[contains(text(),'Vacations')]
    Click Link    Link:Cruises
    Click Link    Link:SIGN-ON
    Click Link    Link:Cruises
    Click Link    Link:REGISTER
    Click Link    Link:Cruises
    Click Link    //a[contains(text(),'SUPPORT')]
    Click Link    Link:Cruises
    Click Link    //a[contains(text(),'CONTACT')]
    Click Link    Link:Cruises
    #Click Link    xpath=(//a[@href="mercuryreservation.php"])[2] # Return to Reservation page
    Click Image   //img[contains(@alt, 'Reservations Open')]
    Click Link    Link:Home

    Close Browser