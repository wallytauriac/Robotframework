*** Settings ***
Library  SeleniumLibrary
Library  ExcelLibrary
Library  DataDriver    .xlsx
Library  Collections
Library  ../TestSuite/WebTours_ReadExcel3.py

*** Variables ***

${wnd_title}  Web Tours
${page_title}  Web Tours
${Login_status}  N


*** Keywords ***
Launch Test
    Open Excel Document  filename=C:\\Users\\wally\\Documents\\Python\\Demo2\\WebTours\\TestSuite\\WebTours_Acceptance.xlsx  doc_id=docid

    Get Sheet  sheet_name=TestCases
    ${tc}=  Read Excel Column  col_num=1  row_offset=0  max_num=0  sheet_name=TestCases
    ${url}=  Read Excel Cell  row_num=2  col_num=2  sheet_name=TestCases
    ${browser}=  Read Excel Cell  row_num=2  col_num=3  sheet_name=TestCases
    ${testdata}  Read Excel Row  row_num=2  col_offset=0  max_num=0  sheet_name=TestCases

    ${sheets}=  Get List Sheet Names

    Switch Current Excel Document  docid
    Get Sheet  ${sheets}[1]

    ${HP_username}=  Get_Excel_Value  1  3
    ${HP_psw}=  Get_Excel_Value  2  3
    ${HP_login}=  Get_Excel_Value  3  3
    ${HP_signup}=  Get_Excel_Value  4  3
    ${HP_admin}=  Get_Excel_Value  5  3
    ${HP_flight}=  Get_Excel_Value  6  3
    ${HP_itenerary}=  Get_Excel_Value  7  3
    ${HP_home}=  Get_Excel_Value  8  3
    ${HP_signoff}=  Get_Excel_Value  9  3
    ${FF2_depart}=  Get_Excel_Value  12  3
    ${FF2_arrival}=  Get_Excel_Value  14  3
    ${FF2_rndtrip}=  Get_Excel_Value  17  3
    ${FF2_aisle}=  Get_Excel_Value  19  3
    ${FF2_continue}=  Get_Excel_Value  24  3
    ${FF3_outbound4}=  Get_Excel_Value  29  3
    ${FF3_continue}=  Get_Excel_Value  30  3
    ${PD_creditcard}=  Get_Excel_Value  37  3
    ${PD_ccexpdate}=  Get_Excel_Value  38  3
    ${PD_continue}=  Get_Excel_Value  40  3
    ${IP_chkbox1}=  Get_Excel_Value  45  3
    ${IP_remall}=  Get_Excel_Value  48  3
    ${CP_username}=  Get_Excel_Value  50  3
    ${CP_password}=  Get_Excel_Value  51  3
    ${CP_pswconfirm}=  Get_Excel_Value  52  3
    ${CP_firstname}=  Get_Excel_Value  53  3
    ${CP_lastname}=  Get_Excel_Value  54  3
    ${CP_address1}=  Get_Excel_Value  55  3
    ${CP_address2}=  Get_Excel_Value  56  3
    ${CP_continue}=  Get_Excel_Value  57  3
    ${AD_update}=  Get_Excel_Value  59  3
    ${AD_home}=  Get_Excel_Value  60  3

    Set Global Variable  ${HP_signoff}
    Set Global Variable  ${HP_signup}
    Set Global Variable  ${HP_admin}
    Set Global Variable  ${HP_username}
    Set Global Variable  ${HP_psw}
    Set Global Variable  ${HP_login}
    Set Global Variable  ${HP_flight}
    Set Global Variable  ${HP_itenerary}
    Set Global Variable  ${HP_home}
    Set Global Variable  ${testdata}
    Set Global Variable  ${FF2_depart}
    Set Global Variable  ${FF2_arrival}
    Set Global Variable  ${FF2_aisle}
    Set Global Variable  ${FF2_rndtrip}
    Set Global Variable  ${FF2_continue}
    Set Global Variable  ${FF3_continue}
    Set Global Variable  ${FF3_outbound4}
    Set Global Variable  ${PD_creditcard}
    Set Global Variable  ${PD_ccexpdate}
    Set Global Variable  ${PD_continue}
    Set Global Variable  ${IP_chkbox1}
    Set Global Variable  ${IP_remall}
    Set Global Variable  ${CP_username}
    Set Global Variable  ${CP_password}
    Set Global Variable  ${CP_pswconfirm}
    Set Global Variable  ${CP_firstname}
    Set Global Variable  ${CP_lastname}
    Set Global Variable  ${CP_address1}
    Set Global Variable  ${CP_address2}
    Set Global Variable  ${CP_continue}
    Set Global Variable  ${AD_update}
    Set Global Variable  ${AD_home}


    Open Browser  ${url}  ${browser}
    Sleep  3s
    Maximize Browser Window
    Log Title                                           #Capture and document window title


Stop Test

    Close Browser
    Close All Excel Documents

Administration
    Select Right Panel Frame
    Click Link  ${HP_admin}
    Unselect Frame
    Select Right Panel Frame
    Wait Until Element Is Visible  ${AD_update}
    Click Element  ${AD_update}
    Wait Until Element Is Visible  ${AD_home}
    Click Link  ${AD_home}
    Unselect Frame


Book Single Flight - One way
    [Arguments]  ${username}  ${psw}
    Sign In Web Tours    ${username}  ${psw}
    Select Left Panel Frame
    Wait Until Element Is Visible  ${HP_flight}  10s
    Click Link  ${HP_flight}
    Unselect Frame
    Select Right Panel Frame
    Select From List By Value    ${FF2_arrival}    Paris
    Click Element    ${FF2_aisle}
    Click Element    ${FF2_continue}
    Click Element    ${FF3_outbound4}
    Click Element    ${FF3_continue}
    Input Text    ${PD_creditcard}    1234567
    Input Text    ${PD_ccexpdate}    12/23
    Click Element    ${PD_continue}
    Capture Page Screenshot
    Unselect Frame
    Select Left Panel Frame
    Click Link    ${HP_signoff}
    Unselect Frame

Book Single Flight - Round Trip
    [Arguments]  ${username}  ${psw}
    Sign In Web Tours    ${username}  ${psw}
    Select Left Panel Frame
    Wait Until Element Is Visible  ${HP_flight}  10s
    Click Link  ${HP_flight}
    Unselect Frame
    Select Right Panel Frame
    Select From List By Value    ${FF2_arrival}    Paris
    Click Element    ${FF2_aisle}
    Click Element    ${FF2_rndtrip}
    Click Element    ${FF2_continue}
    Click Element    ${FF3_outbound4}
    Click Element    ${FF3_continue}
    Input Text    ${PD_creditcard}    1234567
    Input Text    ${PD_ccexpdate}    12/23
    Click Element    ${PD_continue}
    Capture Page Screenshot
    Unselect Frame
    Select Left Panel Frame
    Click Link    ${HP_signoff}
    Unselect Frame

Update Flight
    [Arguments]  ${username}  ${psw}
    Sign In Web Tours   ${username}  ${psw}
    Select Left Panel Frame
    Wait Until Element Is Visible  ${HP_flight}  10s
    Click Link  ${HP_flight}
    Unselect Frame
    Select Right Panel Frame
    Select From List By Value    ${FF2_arrival}    Paris
    Click Element    ${FF2_aisle}
    Click Element    ${FF2_continue}
    Click Element    ${FF3_outbound4}
    Click Element    ${FF3_continue}
    Input Text    ${PD_creditcard}    1234567
    Input Text    ${PD_ccexpdate}    12/23
    Click Element    ${PD_continue}
    Capture Page Screenshot
    Unselect Frame
    Select Left Panel Frame
    Click Link    ${HP_signoff}
    Unselect Frame

Check Itenerary
    [Arguments]  ${username}  ${psw}
    Sign In Web Tours  ${username}  ${psw}
    Select Left Panel Frame
    Wait Until Element Is Visible  ${HP_itenerary}  10s
    Click Link  ${HP_itenerary}
    Unselect Frame
    Select Right Panel Frame
    ${passed}=	Run Keyword And Return Status  Page Should Contain Element  ${IP_chkbox1}
    Run Keyword If  ${passed}  Click Element    ${IP_remall}
    ...          ELSE  Log  Itenerary is empty  level=WARN
    Unselect Frame
    Select Left Panel Frame
    Click Link    ${HP_signoff}
    Unselect Frame

Verify Home page
    [Arguments]  ${username}  ${psw}
    Sign In Web Tours  ${username}  ${psw}
    Select Left Panel Frame
    Wait Until Element Is Visible  ${HP_flight}  10s
    Click Link  ${HP_flight}
    Unselect Frame
    Capture Page Screenshot
    Select Left Panel Frame
    Click Link  ${HP_itenerary}
    Unselect Frame
    Capture Page Screenshot
    Select Left Panel Frame
    Click Link  ${HP_home}
    Unselect Frame
    Capture Page Screenshot
    Select Left Panel Frame
    Click Link  ${HP_signoff}
    Capture Page Screenshot
    Unselect Frame

Check Invalid Login
    [Arguments]  ${username}  ${psw}
    Sign In Web Tours  ${username}  ${psw}

Cancel Flights
    [Arguments]  ${username}  ${psw}
    Sign In Web Tours  ${username}  ${psw}
    Select Left Panel Frame
    Wait Until Element Is Visible  ${HP_itenerary}  10s
    Click Link  ${HP_itenerary}
    Unselect Frame

    Select Right Panel Frame
    ${passed}=	Run Keyword And Return Status  Page Should Contain Element  ${IP_chkbox1}
    Run Keyword If  ${passed}  Click Element    ${IP_remall}
    ...          ELSE  Log  Itenerary is empty  level=WARN
    Unselect Frame
    Select Left Panel Frame
    Click Link    ${HP_signoff}
    Unselect Frame
    
Sign up
    [Arguments]  ${username}  ${psw}
    Select Right Panel Frame
    Wait Until Element Is Visible  ${HP_signup}  10s
    Click Link  ${HP_signup}
    Unselect Frame
    Select Right Panel Frame
    Input Text  ${CP_username}  ${username}
    Input Password  ${CP_password}  ${psw}
    Input Password  ${CP_pswconfirm}  ${psw}
    Input Text  ${CP_firstname}  ${username}
    Input Text  ${CP_lastname}  ${username}
    Input Text  ${CP_address1}  ${username}
    Input Text  ${CP_address2}  ${username}
    Click Element  ${CP_continue}
    Unselect Frame


Invalid Test Case
    [Arguments]  ${tc}  ${description}
    Log  ${tc}
    Log  ${description}
    Log  Invalid Test Case  level=WARN



Sign In Web Tours
    [Arguments]  ${username}  ${psw}
    Select Left Panel Frame
    Wait Until Page Contains Element  ${HP_username}
    Input Text  ${HP_username}  ${username}        #Email Entry Field
    Input Password  ${HP_psw}  ${psw}    #Password Entry Field
    Page Should Contain Element  ${HP_login}       #Existence test for Sign In Button
    Click Element  ${HP_login}
    Unselect Frame
    Check Page Return

Check Page Return
    Select Right Panel Frame
    ${passed}=	Run Keyword And Return Status  Wait Until Page Contains Element  css:body > h1 > b
    Run Keyword If  ${passed}  Log  Error Message: Login Failed  level=WARN
    Run Keyword If  ${passed}  Capture Page Screenshot
    Unselect Frame

Select Left Panel Frame
    ${passed}=	Run Keyword And Return Status	Wait Until Element Is Enabled  css:html > frameset > frame:nth-child(2)  20s
    Run Keyword If  ${passed}  Select Frame  css:html > frameset > frame:nth-child(2)
    ${passed}=	Run Keyword And Return Status	Wait Until Element Is Enabled  css:html > frameset > frame:nth-child(1)
    Run Keyword If  ${passed}  Select Frame  css:html > frameset > frame:nth-child(1)
    Capture Page Screenshot

Select Right Panel Frame
    ${passed}=	Run Keyword And Return Status	Wait Until Element Is Enabled  css:html > frameset > frame:nth-child(2)  20s
    Run Keyword If  ${passed}  Select Frame  css:html > frameset > frame:nth-child(2)
    ${passed}=	Run Keyword And Return Status	Wait Until Element Is Enabled  css:html > frameset > frame:nth-child(2)
    Run Keyword If  ${passed}  Select Frame  css:html > frameset > frame:nth-child(2)
    Capture Page Screenshot