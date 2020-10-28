*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/LoginPage.robot

Suite Setup   Open browser  ${ROOT}  ${BROWSER}
Suite Teardown  Close all browsers

#robot -d Results TestSuite/Login2.robot

*** Variables ***
${BROWSER}  firefox
${ROOT}     https://the-internet.herokuapp.com/
${PSW}      SuperSecretPassword!
${LoginPage}  https://the-internet.herokuapp.com/login

*** Test Cases ***
Valid Login
    [Documentation]  Verify that we can successfully log in to the internet
    Go To Page  ${LoginPage}

    Enter Username  tomsmith
    Enter Password  ${PSW}
    Click the login button
    The current page should be  Secure Area
    Click the logout button