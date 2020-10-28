*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://www.saucedemo.com/
${browser}  chrome
${username}  id:user-name
${password}  id:password

${btn_login}  xpath://*[@id="login_button_container"]/div/form/input[3]
${txt_error}  xpath://*[@id="login_button_container"]//h3
#//*[@id="login_button_container"]/div/form/h3/text()[1]
*** Test Cases ***
Verify Login Fails - Wrong Username
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    Input Text  ${username}  standard_us
    Input Text  ${password}  secret_sauce
    Click Button  ${btn_login}
    Sleep  2s
    Element Should Contain  ${txt_error}  Epic sadface: Username and password do not match any user in this service
    Close Browser