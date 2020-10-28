*** Settings ***
Documentation     A test suite with a dual test for valid login.
...               This test will verify the Firefox and Chrome browsers.
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Library             SeleniumLibrary
Resource            resource.robot

Test Teardown  Close Browser
Test Template   Valid Login Test

*** Test Cases ***  Browser
Chrome Test         chrome
Firefox Test        firefox

*** Keywords ***
Valid Login Test
    [Arguments]  ${BROWSER}
    Open Browser To Login Page  ${BROWSER}
    Input Username Text
    Input Password Text
    Submit Credentials
