*** Settings ***
| Library    | SeleniumLibrary
#| Library    | Selenium2Library
| Library    | PageObjectLibrary
| Library    | ../resources/LoginPage.py
| Library    | ../resources/SecureAreaPage.py
|
| Suite Setup    | Open browser | ${ROOT} | ${BROWSER}
| Suite Teardown | Close all browsers

#robot -d Results TestSuite/login.robot

*** Variables ***
| ${BROWSER} | firefox
| ${ROOT}    | https://the-internet.herokuapp.com/
| ${PSW}     | SuperSecretPassword!

*** Test Cases ***
| Valid Login
| | [Documentation] | Verify that we can successfully log in to the internet
| | [Setup]         | Go to page | LoginPage
| |
| | Enter username | tomsmith
| | Enter password | ${PSW}
| | Click the login button
| | The current page should be | SecureAreaPage