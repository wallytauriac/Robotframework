*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${URL}            https://the-internet.herokuapp.com/login
${BROWSER}        Firefox
${DELAY}          0
${VALID USER}     tomsmith
${VALID PASSWORD}   SuperSecretPassword!
${obj_error}      xpath://*[@id="flash"]
${btn_logout}     xpath:/html/body/div[2]/div/div/a/i
${obj_message}      xpath://*[@id="flash"]
${btn_login}     xpath:/html/body/div[2]/div/div/form/button
${obj_username}  id:username
${obj_password}  id:password

*** Keywords ***
Launch Browser
    [Arguments]  ${BROWSER}
    Open Browser    https://www.google.com    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Page Should Be Open

Page Should Be Open
    Title Should Be    Google

Login Page Should Be Open
    Title Should Be    The Internet

Go To Login Page
    Go To    ${URL}
    Login Page Should Be Open

Input Username Text
    [Arguments]    ${USER}
    Input Text    ${obj_username}    ${USER}

Input Password Text
     [Arguments]    ${PASSWORD}
    Input Password    ${obj_password}    ${PASSWORD}

Submit Credentials
    Click Button    ${btn_login}

Click Logout
    Log Title
    ${Message}=  Get Text  ${obj_message}
    Click Element    ${btn_logout}