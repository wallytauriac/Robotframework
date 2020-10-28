*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${obj_username}  id:username
${obj_password}  id:password
${obj_submit}  xpath://*[@id="login"]/button/i
${obj_SAP}  xpath://*[@id="content"]/div/h2/text()
${obj_logout}  xpath://*[@id="content"]/div/a/i

*** Keywords ***
Go To Page
    [Arguments]  ${URL}
    Go To  ${URL}

Enter Username
    [Arguments]  ${name}
    Input Text  ${obj_username}  ${name}

Enter Password
    [Arguments]  ${psw}
    Input Password  ${obj_password}  ${psw}

Click the login button
    Click Element  ${obj_submit}

The current page should be
    [Arguments]  ${sap}
    Page Should Contain  ${sap}

Click the logout button
    Click Element  ${obj_logout}

