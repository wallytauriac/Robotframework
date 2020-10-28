*** Settings ***
Documentation     A test suite with a single test for Web Tours
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
Web Tours test
    Open Browser    http://localhost:1080/WebTours/    ${BROWSER}
    Maximize Browser Window
    Select Frame  css:html > frameset > frame:nth-child(2)
    Select Frame  css:html > frameset > frame:nth-child(1)

    Log Title
    #Select Frame  /html/frameset/frame[1]
    Wait Until Element Is Enabled  xpath://input[@name="username"]  20s
    Input Text    //input[@name="username"]    demo
    Input Text    //input[@name="password"]    demo
    Click Element    //input[@name="login"]
    Capture Page Screenshot
    Wait Until Element Is Enabled  css:html > frameset > frame:nth-child(2)  20s
    Select Frame  css:html > frameset > frame:nth-child(2)
    Wait Until Element Is Enabled  css:html > frameset > frame:nth-child(1)
    Select Frame  css:html > frameset > frame:nth-child(1)
    Capture Page Screenshot

    #Click Element    xpath=(//img)[4]
    Wait Until Element Is Enabled  xpath://a[@href="welcome.pl?signOff=1"]  10s
    Click Element    xpath://a[@href="welcome.pl?signOff=1"]
    Capture Page Screenshot
    Log Title

    Close Browser