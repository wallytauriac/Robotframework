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
    Click Link    xpath=(//a[@title="T-shirts"])[2]
    Wait Until Element Is Enabled  //i[@class="icon-home"]  10s
    Click Element    //i[@class="icon-home"]
    Click Element    //b
    Wait Until Element Is Enabled  //i[@class="icon-home"]  10s
    Click Element    //i[@class="icon-home"]
    Click Link    //a[@title="Contact Us"]
    Wait Until Element Is Enabled  //a[@title="Log in to your customer account"]  20s
    Click Link    //a[@title="Log in to your customer account"]
    Wait Until Element Is Enabled  //i[@class="icon-home"]  10s
    Click Element    //i[@class="icon-home"]

    Close Browser