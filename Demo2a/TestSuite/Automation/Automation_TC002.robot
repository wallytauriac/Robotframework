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
    Input Text    //input[@name="search_query"]    dress
    Click Element    //button[@name="submit_search"]
    Wait Until Element Is Enabled  //i[@class="icon-home"]  10s
    Click Element    //i[@class="icon-home"]

    Close Browser