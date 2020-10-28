*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser  localhost:7272  chrome
    Input Text    username_field  demo
    Input Text    password_field  mode
    Click Button  login_button
    Sleep  3s
    Close Browser
