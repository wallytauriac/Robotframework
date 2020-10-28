*** Settings ***
Library  SeleniumLibrary
Library  ExcelLibrary
Library  DataDriver    .xlsx
Library  Collections

*** Variables ***

${error_msg}  error


${txt_title}  Fly with peace...
${Book_title}   Flight Application | Next Gen Digital
${Confirm_title}   Flight Application | Next Gen Digital
${txt_user}  xpath://input[@type="email"]

${txt_password}  xpath://input[@type="password"]
${btn_login}  xpath://div[@name="SignIn"]
${btn_getfare}  xpath://*[@id="Book"]/p[4]/button
${txt_error}  //*[@id="InvalidLogin"]/p/label/font  #Invalid user/psw
${txt_logout}  //button[4][@class="tablinks"]
${chk_roundtrip}  xpath://input[@type="checkbox"]
${rad_flight}  xpath://*[@id="flight"]
${rad_flighthotel}  xpath://*[@id="flighthotel"]


*** Keywords ***
Launch Browser

    Open Excel Document  filename=C:/Users/wally/Documents/Python/Demo/TestSuite/NextGenDigital/BookFlightTestCase.xlsx  doc_id=docid
    Get Sheet  sheet_name=Sheet1
    ${url}=  Read Excel Cell  row_num=2  col_num=2  sheet_name=Sheet1
    ${browser}=  Read Excel Cell  row_num=2  col_num=3  sheet_name=Sheet1
    ${testCases}  Read Excel Column  col_num=1  row_offset=0  max_num=0  sheet_name=Sheet1
    ${users}  Read Excel Column  col_num=4  row_offset=0  max_num=0  sheet_name=Sheet1
    ${email}=  Read Excel Cell  row_num=2  col_num=4  sheet_name=Sheet1
    ${passwords}  Read Excel Column  col_num=5  row_offset=0  max_num=0  sheet_name=Sheet1
    ${psw}=  Read Excel Cell  row_num=2  col_num=5  sheet_name=Sheet1
    Set Global Variable  ${email}
    Set Global Variable  ${psw}
    Open Browser  ${url}  ${browser}
    Sleep  3s
    Maximize Browser Window

Stop Browser

    Close Browser
    Close All Excel Documents

Launch Test
    [Arguments]  ${email}  ${psw}
    Select Frame  //*[@id="iframe-015"]
    Sleep  2s
    #Wait Until Element Is Visible  ${txt_user}  10 seconds
    Input Text  ${txt_user}  ${email}
    Input Password  ${txt_password}  ${psw}
    Page Should Contain Element  ${btn_login}
    Click Element  ${btn_login}
    Sleep  2s

Stop Test
    Click Button  ${txt_logout}