*** Settings ***
Documentation     A test suite with a single test for Welcome: Mercury Tours
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3
${URL}  http://www.newtours.demoaut.com/mercurywelcome.php


*** Test Cases ***
Welcome: Mercury Tours test
    Open Browser   ${URL}     ${BROWSER}
    Element Text Should Be  xpath://table/tbody/tr[1]/td/font/b   Jun 29, 2020
    Click Link    xpath://table/tbody/tr[1]/td[2]/font/a
    Click Link    //a[@href="mercurywelcome.php"]               #Left panel Home
    Click Link    //a[@href="mercuryreservation.php"]           #Left panel Flights
    Click Link    //a[@href="mercuryunderconst.php"]            #Left panel Hotels
    Click Link    //a[contains(text(),'Car Rentals')]           #Left panel Car Rentals
    Click Link    //a[@href="mercurycruise.php"]                #Left panel Cruises
    Click Link    //a[contains(text(),'Destinations')]          #Left panel Destinations
    Click Link    //a[contains(text(),'Vacations')]             #Left panel Vacations
    Click Link    //a[@href="mercurysignon.php"]                #Top panel SIGNON
    Click Link    //a[@href="mercuryregister.php"]              #Top panel REGISTER
    Click Link    //a[contains(text(),'SUPPORT')]               #Top panel SUPPORT
    Click Link    //a[contains(text(),'CONTACT')]               #Top panel CONTACT
    Click Link    //a[@href="mercurywelcome.php"]               #Left panel Home
    Input Text    //input[@name="userName"]        123
    Input Password    //input[@name="password"]    ***
    Click Element    //input[@name="login"]
    Click Link    //a[@href="mercurywelcome.php"]               #Left panel Home
    Click Link    //a[contains(text(),'your destination')]      #Right side Destinations
    Click Element    xpath=(//img)[7]
    Click Link    xpath=(//a[@href="mercuryunderconst.php"])[8]
    Click Element    xpath=(//img)[7]
    Click Link    xpath=(//a[@href="mercuryregister.php"])[2]
    Click Link    //a[@href="mercurywelcome.php"]
    #Click Link    //a[contains(text(),'featured vacation ')]    #Right side Vacations
    #Click Link    //a[contains(text(),'register here')]         #Right side REGISTER
    #Click Link    //a[@href="http://businesstravel.about.com/mbody.htm?PM=78_101_T&cob=home"]
    #Click Link    //a[@href="http://www.salon.com/travel/index.html"]

    Close Browser