*** Settings ***
Documentation     A test suite with a single test for Under Construction: Mercury Tours
...               Created by hats' Robotcorder
Library           Selenium2Library    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
Under Construction: Mercury Tours test
    Open Browser    http://newtours.demoaut.com/mercuryunderconst.php    ${BROWSER}
    Click Link    //a[@href="mercurywelcome.php"]
    Click Link    //a[@href="mercuryreservation.php"]
    Click Link    //a[@href="mercuryunderconst.php"]
    Click Link    xpath=(//a[@href="mercuryunderconst.php"])[2]
    Click Link    //a[@href="mercurycruise.php"]
    Click Link    xpath=(//a[@href="mercuryunderconst.php"])[3]
    Click Link    xpath=(//a[@href="mercuryunderconst.php"])[4]
    Click Link    //a[@href="mercurysignon.php"]
    Click Link    //a[@href="mercuryregister.php"]
    Click Link    xpath=(//a[@href="mercuryunderconst.php"])[5]
    Click Link    xpath=(//a[@href="mercuryunderconst.php"])[6]
    Click Link    xpath=(//a[@href="mercurywelcome.php"])[2]

    Close Browser