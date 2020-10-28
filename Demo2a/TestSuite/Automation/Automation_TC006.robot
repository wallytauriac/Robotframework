*** Settings ***
Documentation     A test suite with a single test for My Store
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
My Store test
    Open Browser    http://automationpractice.com/index.php    ${BROWSER}
    Mouse Over  //a[@title="Women"]
    Click Link    //a[@title="Tops"]
    Click Element    //h2[@class="title_block"]
    Wait Until Element Is Enabled  //a[@title="Dresses"]  10s
    Click Link    xpath=(//a[@title="Dresses"])[2]
    #Click Link    //a[@title="Dresses"]
    Click Element    //h2[@class="title_block"]
    Wait Until Element Is Enabled  //i[@class="icon-home"]  10s
    Click Element    //i[@class="icon-home"]

    Close Browser