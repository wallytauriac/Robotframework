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
    Input Text    //input[@name="search_query"]    women
    Click Element    //button[@name="submit_search"]
    Click Element    xpath=(//div[@class="row"])[3]
    Input Text    //input[@name="search_query"]    dress
    Click Element    //button[@name="submit_search"]

    Close Browser