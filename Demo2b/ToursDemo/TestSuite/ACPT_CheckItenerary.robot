*** Settings ***
Documentation     A test suite with a single test for Sign-on: Mercury Tours
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10
Library           Screenshot
Library           ScreenCapLibrary

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
Sign-on: Mercury Tours test
    Open Browser    http://newtours.demoaut.com/mercurywelcome.php    ${BROWSER}
    Wait Until Page Contains Element  //input[@name="userName"]
    Input Text    //input[@name="userName"]    demo
    Input Text    //input[@name="password"]    demo
    Click Element    //input[@name="login"]
    Click Link    Link:ITINERARY
    Log Title
    Screenshot.Set Screenshot Directory  ../Results
    ScreenCapLibrary.Take Screenshot    name=screenshot  format=png  quality=0
    Click Link    Link:PROFILE
    Log Title

    ScreenCapLibrary.Take Screenshot    name=screenshot  format=png  quality=0
    Click Link    Link:SIGN-OFF

    Close Browser