*** Settings ***
Documentation     A test suite with a single test for Register: Mercury Tours
...               Created by hats' Robotcorder
Library           Selenium2Library    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
Register: Mercury Tours test
    Open Browser    http://www.newtours.demoaut.com/mercurywelcome.php    ${BROWSER}
    Click Link    Link:REGISTER
    Log Title
    Click Link    Link:Home
    Click Link    Link:REGISTER
    Click Link    Link:Flights
    Click Link    Link:REGISTER
    Click Link    Link:Hotels
    Click Link    Link:REGISTER
    Click Link    //a[contains(text(),'Car Rentals')]
    Click Link    Link:REGISTER
    Click Link    Link:Cruises
    Click Link    Link:REGISTER
    Click Link    //a[contains(text(),'Destinations')]
    Click Link    Link:REGISTER
    Click Link    //a[contains(text(),'Vacations')]
    Click Link    Link:REGISTER
    Click Link    Link:SIGN-ON
    Click Link    Link:REGISTER
    Click Link    //a[contains(text(),'SUPPORT')]
    Click Link    Link:REGISTER
    Click Link    //a[contains(text(),'CONTACT')]
    Click Link    Link:REGISTER
    Input Text    //input[@name="firstName"]  Jim
    Input Text    //input[@name="lastName"]  Bean
    Input Text    //input[@name="phone"]  123-123-1234
    Input Text    //input[@name="userName"]  waldo
    Input Text    //input[@name="address1"]  1234 waldo
    Input Text    //input[@name="address2"]  apt 2
    Input Text    //input[@name="city"]  Dime
    Input Text    //input[@name="state"]  AK
    Input Text    //input[@name="postalCode"]  78678
    Select From List By Value    //select[@name="country"]    215
    Input Text    //input[@name="email"]  abc@xyz.com
    Input Text    //input[@name="password"]    ***
    Input Text    //input[@name="confirmPassword"]    ***
    Page Should Contain Element  //input[@name="register"]
    #Click Element    //input[@name="register"]

    Close Browser