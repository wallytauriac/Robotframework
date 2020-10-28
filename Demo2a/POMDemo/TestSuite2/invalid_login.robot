*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Launch Browser  ${BROWSER}
Suite Teardown    Close Browser
Test Setup        Go To Login Page

Test Template     Login With Invalid Credentials
Resource          ../resources/resource.robot

#robot -d Results TestSuite2/invalid_login.robot

*** Test Cases ***               USER NAME        PASSWORD
Invalid Username                 invalid          ${VALID PASSWORD}
Invalid Password                 ${VALID USER}    invalid
Invalid Username And Password    invalid          whatever
Empty Username                   ${EMPTY}         ${VALID PASSWORD}
Empty Password                   ${VALID USER}    ${EMPTY}
Empty Username And Password      ${EMPTY}         ${EMPTY}

*** Keywords ***
Login With Invalid Credentials
    [Arguments]    ${username}    ${password}
    Input Username Text    ${username}
    Input Password Text    ${password}
    Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    Location Should Be    ${URL}
    Title Should Be    The Internet
    Page Should Contain Element  ${obj_error}
    ${err_msg}=  Get Text    ${obj_error}
    Log  ${err_msg}
