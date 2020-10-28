*** Settings ***
Documentation     A test suite with a single test for Flight Confirmation: Mercury Tours
...               Created by hats' Robotcorder
...                 Flight Confirmation: Mercury Tours
Library           SeleniumLibrary    timeout=10

Suite Setup    Open Browser    http://newtours.demoaut.com/mercurywelcome.php    ${BROWSER}
*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
Login Test
    Mercury Tours Login

Flight Confirmation: Mercury Tours test 4
    #Open Browser    http://newtours.demoaut.com/mercurypurchase2.php    ${BROWSER}
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
    #Click Link    //a[@href="mercurysignoff.php"]
    #Click Link    //a[@href="mercuryregister.php"]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[5]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[6]
    #Buttons
    Page Should Contain Link  xpath=(//a[@href="mercuryreservation.php"])[2]
    #Click Link    xpath=(//a[@href="mercuryreservation.php"])[2]
    Page Should Contain Link  xpath=(//a[@href="mercurywelcome.php"])[2]
    #Click Link    xpath=(//a[@href="mercurywelcome.php"])[2]
    Page Should Contain Link  xpath=(//a[@href="mercurysignoff.php"])[2]
    Click Link    xpath=(//a[@href="mercurysignoff.php"])[2]

    Close Browser

*** Keywords ***
Mercury Tours Login

    Input Text    //input[@name="userName"]    demo
    Input Password    //input[@name="password"]    demo
    Click Element    //input[@name="login"]
    Click Element    //input[@name="tripType"]
    Click Element    Name:findFlights  #Continue to page 2
    Click Element    Name:reserveFlights  #Continue to page 2a
    Click Element    //input[@name="buyFlights"]  #Purchase and proceed to page 2b