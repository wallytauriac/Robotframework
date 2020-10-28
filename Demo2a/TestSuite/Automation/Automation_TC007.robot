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
    Maximize Browser Window
    Sleep  2s
    #Wait Until Element Is Enabled  //a[@title="Dresses"]  10s
    Mouse Over   xpath=(//a[@title="Dresses"])[2]
    Wait Until Element Is Enabled  xpath=(//a[@title="Casual Dresses"])[2]  20s
    Click Link    xpath=(//a[@title="Casual Dresses"])[2]

    Wait Until Element Is Enabled  //p[@class="title_block"]  10s
    Click Element    //p[@class="title_block"]
    ${tval1}=  Get Text  //p[@class="title_block"]
    Mouse Over   xpath=(//a[@title="Dresses"])[2]
    Wait Until Element Is Enabled  xpath=(//a[@title="Evening Dresses"])[2]  20s
    Click Link    xpath=(//a[@title="Evening Dresses"])[2]
    Wait Until Element Is Enabled  //p[@class="title_block"]  10s
    Click Element    //p[@class="title_block"]
    Mouse Over   xpath=(//a[@title="Dresses"])[2]
    Wait Until Element Is Enabled  xpath=(//a[@title="Summer Dresses"])[2]  20s
    Click Link    xpath=(//a[@title="Summer Dresses"])[2]
    Wait Until Element Is Enabled  //p[@class="title_block"]  10s
    Click Element    //p[@class="title_block"]

    Wait Until Element Is Enabled  //i[@class="icon-home"]  10s
    Click Element    //i[@class="icon-home"]

    Close Browser