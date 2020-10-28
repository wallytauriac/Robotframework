*** Settings ***
Documentation     A test suite with a single test for My Store
...               Created by hats' Robotcorder
Library           Selenium2Library    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
My Store test
    Open Browser    http://automationpractice.com/index.php    ${BROWSER}
    Click Link    xpath=(//a[@title="Dresses"])[2]
    Wait Until Element Is Enabled  //i[@class="icon-home"]  10s
    Click Link    //a[@title="Return to Home"]

    Close Browser