*** Settings ***
Documentation     A test suite with a single test for Electronics, Cars, Fashion, Collectibles & More | eBay
...               Created by hats' Robotcorder
...               General Customer Services Testing
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3
${obj_signin}  xpath=//a[@href="https://signin.ebay.com/ws/eBayISAPI.dll?SignIn&ru=https%3A%2F%2Fwww.ebay.com%2F"]  #Signin page link
${obj_userid}  xpath=//input[@name="userid"]  # email user name on signin page
${obj_continue}  xpath=//button[@name="signin-continue-btn"]  # Signin continue button
${obj_register}  xpath=//a[@href="https://reg.ebay.com/reg/PartialReg?ru=https%3A%2F%2Fwww.ebay.com%2F"]  #Register page link
${obj_fname}  xpath=//input[@name="firstname"]
${obj_lname}  xpath=//input[@name="lastname"]
${obj_email}  xpath=//input[@name="email"]
${obj_psw}  xpath=//input[@name="PASSWORD"]
# Home page
${obj_myebay}  xpath=//a[@title="My eBay"]
${obj_watchlist}  xpath=//a[@title="Watchlist"]

*** Test Cases ***
Customer Services Scenario
    Set Selenium Speed  1 seconds
    Open Browser    https://www.ebay.com/    ${BROWSER}
    Maximize Browser Window
    Click Link    ${obj_signin}
    # CAPTCHA VERIFY PROCESS INTERMITENT REQUEST
    Wait Until Element Is Visible  ${obj_userid}  timeout=20
    Input Text    ${obj_userid}    abc@xyz.com
    Click Element    ${obj_continue}  # Signin continue button
    Go back
    Click Link    ${obj_register}
    # CAPTCHA VERIFY PROCESS INTERMITENT REQUEST
    Wait Until Element Is Visible  ${obj_fname}  timeout=20
    Input Text    ${obj_fname}    MyName
    Input Text    ${obj_lname}    LName
    Input Text    ${obj_email}    abc@xyz.com
    Input Text    ${obj_psw}    8^=A&3etbZ7Chm6
    Go Back
    Click Link    ${obj_myebay}
    # An attempt to click this link twice attempts signin
    # This leads to captch verify
    Go Back
    Click Link    ${obj_watchlist}
    Click Link    ${obj_watchlist}

    Close Browser