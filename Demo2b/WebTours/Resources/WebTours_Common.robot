*** Settings ***
Library  SeleniumLibrary
Library  ExcelLibrary
Library  DataDriver    .xlsx
Library  Collections
Library  ../TestSuite/WebTours_ReadExcel.py

*** Variables ***

${wnd_title}  Web Tours
${page_title}  Web Tours
${Login_status}  N


*** Keywords ***
Launch Test
    Open Excel Document  filename=C:\\Users\\wally\\Documents\\Python\\Demo2\\WebTours\\TestSuite\\WebTours_Sanity.xlsx  doc_id=docid

    Get Sheet  sheet_name=REPO
    ${tc}=  Read Excel Column  col_num=1  row_offset=0  max_num=0  sheet_name=REPO
    ${wnd_name}=  Read Excel Column  col_num=2  row_offset=0  max_num=0  sheet_name=REPO
    ${wnd_label}=  Read Excel Column  col_num=3  row_offset=0  max_num=0  sheet_name=REPO
    ${wnd_object}=  Read Excel Column  col_num=4  row_offset=0  max_num=0  sheet_name=REPO
    ${objecttype}=  Read Excel Column  col_num=5  row_offset=0  max_num=0  sheet_name=REPO
    ${HP_signup}=  Get_Excel_Value  4  3
    ${HP_admin}=  Get_Excel_Value  5  3
    ${HP_signoff}=  Get_Excel_Value  9  3
    ${HP_flight}=  Get_Excel_Value  6  3
    ${FF2_continue}=  Get_Excel_Value  24  3
    ${FF3_continue}=  Get_Excel_Value  30  3
    ${PD_continue}=  Get_Excel_Value  40  3
    ${FF8_continue}=  Get_Excel_Value  7  3

    ${CP_continue}=  Get_Excel_Value  57  3

    #Set Global Variable  ${objecttype}
    #Set Global Variable  ${tc}
    Set Global Variable  ${wnd_object}
    Set Global Variable  ${wnd_name}
    ${obj_description}=  Read Excel Column  col_num=7  row_offset=0  max_num=0  sheet_name=REPO

    ${sheets}=  Get List Sheet Names

    Switch Current Excel Document  docid
    Get Sheet  ${sheets}[1]
    ${url}=  Read Excel Cell  row_num=2  col_num=2  sheet_name=${sheets}[1]
    ${browser}=  Read Excel Cell  row_num=2  col_num=3  sheet_name=${sheets}[1]
    ${testdata}  Read Excel Row  row_num=2  col_offset=0  max_num=0  sheet_name=${sheets}[1]
    Set Global Variable  ${testdata}
    Set Global Variable  ${HP_flight}
    Set Global Variable  ${FF2_continue}
    Set Global Variable  ${FF3_continue}
    Set Global Variable  ${PD_continue}
    Set Global Variable  ${FF8_continue}
    Set Global Variable  ${CP_continue}
    Set Global Variable  ${HP_signoff}
    Set Global Variable  ${HP_signup}
    Set Global Variable  ${HP_admin}
    Open Browser  ${url}  ${browser}
    Sleep  3s
    Maximize Browser Window
    Set Selenium Speed  1s
    Log Title                                           #Capture and document window title


Stop Test

    Close Browser
    Close All Excel Documents

Prepare For Page Change
    [Arguments]  ${wnd_label}  ${wnd_title}  ${wnd_object}
    Log  ${wnd_label}
    ${var1}=  Run Keyword If  "${wnd_label}"=="Find Flight"  Run Keyword And Return  Check Login Status
    ...    ELSE IF  "${wnd_label}"=="Find Flight 2"  Run Keyword And Return  Switch Page1
    ...    ELSE IF  "${wnd_label}"=="Find Flight 3"  Run Keyword And Return  Switch Page2
    ...    ELSE IF  "${wnd_label}"=="Payment Details"  Run Keyword And Return  Switch Page3
    ...    ELSE IF  "${wnd_label}"=="Invoice"  Run Keyword And Return  Switch Page4
    ...    ELSE IF  "${wnd_label}"=="Itenerary"  Run Keyword And Return  Switch Page5
    ...    ELSE IF  "${wnd_label}"=="Customer Profile"  Run Keyword And Return  Switch Page6
    ...    ELSE IF  "${wnd_label}"=="Administration Page"  Run Keyword And Return  Switch Page7
    ...    ELSE  Run Keyword And Return  Check Login Status


Switch Page1
    Select Left Panel Frame
    Wait Until Element Is Visible  ${HP_flight}  10s
    Click Link  ${HP_flight}   #Link flight search
    Run Keyword And Return  Unselect Frame

Switch Page2

    Select Right Panel Frame
    Wait Until Element Is Visible  ${FF2_continue}  10s
    Click Element  ${FF2_continue}   #Continue button Find
    Run Keyword And Return  Unselect Frame

Switch Page3

    Select Right Panel Frame
    Wait Until Element Is Visible  ${FF3_continue}  10s
    Click Element  ${FF3_continue}   #Continue button Reserve
    Run Keyword And Return  Unselect Frame

Switch Page4

    Select Right Panel Frame
    Wait Until Element Is Visible  ${PD_continue}  10s
    Click Element  ${PD_continue}   #Continue button buy
    Run Keyword And Return  Unselect Frame

Switch Page5

    Select Left Panel Frame
    Wait Until Element Is Visible  ${FF8_continue}  10s
    Click Element  ${FF8_continue}   #Itenerary button
    Run Keyword And Return  Unselect Frame

Switch Page6
    Select Left Panel Frame
    Wait Until Element Is Visible  ${HP_signoff}  10s
    Click Link  ${HP_signoff}   #SignOff button
    Unselect Frame
    Select Right Panel Frame
    Wait Until Element Is Visible  ${HP_signup}  10s
    Click Link  ${HP_signup}   #SignUp link
    Run Keyword And Return  Unselect Frame

Switch Page7

    Go Back
    Select Right Panel Frame
    Wait Until Element Is Visible  ${HP_admin}  10s
    Click Link  ${HP_admin}   #Administration link
    Run Keyword And Return  Unselect Frame

Send To Log
    [Arguments]  ${wnd_object}
    Log  ${wnd_object}                                  #Display value in the report

Verify Element
    [Arguments]  ${wnd_object}

    ${varx}=  Run Keyword If  "${iframe}"=="L"  Select Left Panel Frame
    ${vary}=  Run Keyword If  "${iframe}"=="R"  Select Right Panel Frame
    Wait Until Element Is Visible  ${wnd_object}  20s
    Page Should Contain Element  ${wnd_object}          #Existence test
    Unselect Frame

Verify List
    [Arguments]  ${wnd_object}
    ${varx}=  Run Keyword If  "${iframe}"=="L"  Select Left Panel Frame
    ${vary}=  Run Keyword If  "${iframe}"=="R"  Select Right Panel Frame
    Page Should Contain List  ${wnd_object}          #Existence test
    Unselect Frame

Verify Button
    [Arguments]  ${wnd_object}
    ${varx}=  Run Keyword If  "${iframe}"=="L"  Select Left Panel Frame
    ${vary}=  Run Keyword If  "${iframe}"=="R"  Select Right Panel Frame
    Page Should Contain Button  ${wnd_object}           #Existence test
    Unselect Frame

Verify Link
    [Arguments]  ${wnd_object}
    ${varx}=  Run Keyword If  "${iframe}"=="L"  Select Left Panel Frame
    ${vary}=  Run Keyword If  "${iframe}"=="R"  Select Right Panel Frame
    Page Should Contain Link  ${wnd_object}             #Existence test
    Unselect Frame

Verify Image
    [Arguments]  ${wnd_object}
    ${varx}=  Run Keyword If  "${iframe}"=="L"  Select Left Panel Frame
    ${vary}=  Run Keyword If  "${iframe}"=="R"  Select Right Panel Frame
    Page Should Contain Image  ${wnd_object}             #Existence test
    Unselect Frame

Verify Checkbox
    [Arguments]  ${wnd_object}
    ${varx}=  Run Keyword If  "${iframe}"=="L"  Select Left Panel Frame
    ${vary}=  Run Keyword If  "${iframe}"=="R"  Select Right Panel Frame
    Page Should Contain Checkbox  ${wnd_object}         #Existence test
    Unselect Frame

Verify Radio Button
    [Arguments]  ${wnd_object}
    ${varx}=  Run Keyword If  "${iframe}"=="L"  Select Left Panel Frame
    ${vary}=  Run Keyword If  "${iframe}"=="R"  Select Right Panel Frame
    Page Should Contain Radio Button  ${wnd_object}     #Existence test
    Unselect Frame

Verify Text Field
    [Arguments]  ${wnd_object}
    ${varx}=  Run Keyword If  "${iframe}"=="L"  Select Left Panel Frame
    ${vary}=  Run Keyword If  "${iframe}"=="R"  Select Right Panel Frame
    Wait Until Element Is Visible  ${wnd_object}  10s
    Page Should Contain Textfield  ${wnd_object}        #Existence test
    Unselect Frame

Check Login Status
    Log  ${Login_status}
    ${var1}=  Run Keyword If  "${Login_status}"=="N"  Run Keyword And Return  Sign In Web Tours

Sign In Web Tours
    Select Left Panel Frame
    Wait Until Page Contains Element  ${wnd_object}[3]
    Input Text  ${wnd_object}[1]  ${testdata}[3]        #Email Entry Field
    Input Password  ${wnd_object}[2]  ${testdata}[4]    #Password Entry Field
    Page Should Contain Element  ${wnd_object}[3]       #Existence test for Sign In Button
    Click Element  ${wnd_object}[3]
    #Handle Alert
    ${Login_status}=  Set Variable  Y
    Set Global Variable  ${Login_status}

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