*** Settings ***
Library  SeleniumLibrary
Library  ExcelLibrary
#Library  DataDriver    .xlsx
Library  Collections

*** Variables ***
${url}  ngendigital/demo-application
${browser}  chrome
${email}  ${EMPTY}
${psw}  ${EMPTY}
${error_msg}  error


${txt_title}  Demo Application | Next Gen Digital
${error_title}  Demo (Standard) | Next Gen Digital
${txt_user}  xpath://input[@type="email"]

${txt_password}  xpath://input[@type="password"]
${btn_login}  xpath://div[@name="SignIn"]
${txt_error}  //*[@id="InvalidLogin"]/p/label/font  #Invalid user/psw


*** Keywords ***
Launch Browser

    Open Excel Document  filename=C:/Users/wally/Documents/Python/Demo/TestSuite/NextGenDigital/LoginTestCase.xlsx  doc_id=docid
    Get Sheet  sheet_name=Sheet1
    ${url}=  Read Excel Cell  row_num=2  col_num=2  sheet_name=Sheet1
    ${browser}=  Read Excel Cell  row_num=2  col_num=3  sheet_name=Sheet1
    ${testCases}  Read Excel Column  col_num=1  row_offset=0  max_num=0  sheet_name=Sheet1
    ${users}  Read Excel Column  col_num=4  row_offset=0  max_num=0  sheet_name=Sheet1
    ${passwords}  Read Excel Column  col_num=5  row_offset=0  max_num=0  sheet_name=Sheet1

    Open Browser  ${url}  ${browser}
    Sleep  3s
    Maximize Browser Window
    Select Frame  //*[@id="iframe-015"]
    Sleep  2s

Stop Browser
    Close Browser
    Close All Excel Documents
