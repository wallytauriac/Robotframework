*** Settings ***
Library  SeleniumLibrary
Library  ExcelLibrary
Library  DataDriver    .xlsx
Library  Collections
Resource  ../../Resources/NextGenCommon.robot


Suite Setup  NextGenCommon.Launch Browser
Suite Teardown  NextGenCommon.Stop Browser
Test Template  Login Scenarios

*** Test Cases ***
Verify Invalid Login Cases - ${testcase} - ${description}


*** Keywords ***
Login Scenarios
    [Arguments]  ${email}  ${psw}  ${error_title}  ${emsg}
    #${elem}  Get WebElement  name:"email"
    Wait Until Element Is Visible  ${txt_user}  10 seconds
    Input Text  ${txt_user}  ${email}
    Input Password  ${txt_password}  ${psw}
    Page Should Contain Element  ${btn_login}
    Click Element  ${btn_login}
    Sleep  2s
    Title Should Be  ${txt_title}
    Current Frame Should Contain  ${emsg}  loglevel=INFO
    #Sleep  3s