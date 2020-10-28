*** Settings ***
Library  SeleniumLibrary
Library  ExcelLibrary
Library  DataDriver    .xlsx
Library  Collections
Library  ../TestSuite/ReadExcel.py

*** Variables ***

${page_title}  Welcome: Mercury Tours
${Login_status}  N


*** Keywords ***
Launch Test
    Open Excel Document  filename=C:/Users/wally/Documents/Python/Demo2/ToursDemo/TestSuite/Sanity_HomePage.xlsx  doc_id=docid
    Get Sheet  sheet_name=REPO
    ${tc}=  Read Excel Column  col_num=1  row_offset=0  max_num=0  sheet_name=REPO
    ${wnd_name}=  Read Excel Column  col_num=2  row_offset=0  max_num=0  sheet_name=REPO
    ${wnd_object}=  Read Excel Column  col_num=3  row_offset=0  max_num=0  sheet_name=REPO
    #${objecttype}=  Read Excel Column  col_num=4  row_offset=0  max_num=0  sheet_name=REPO
    ${HP_home}=  Get_Excel_Value  2  2
    ${HP_hotels}=  Get_Excel_Value  4  2
    ${UC_signon}=  Get_Excel_Value  9  2
    ${UC_return}=  Get_Excel_Value  20  2
    ${LO_Button}=  Get_Excel_Value  41  2
    ${FF_Continue}=  Get_Excel_Value  42  2
    ${SF_Continue}=  Get_Excel_Value  51  2
    ${BF_Continue}=  Get_Excel_Value  63  2
    ${SO_return}=  Get_Excel_Value  67  2
    ${L_register}=  Get_Excel_Value  10  2
    #Set Global Variable  ${objecttype}
    #Set Global Variable  ${tc}
    Set Global Variable  ${wnd_object}
    Set Global Variable  ${wnd_name}
    ${obj_description}=  Read Excel Column  col_num=5  row_offset=0  max_num=0  sheet_name=REPO

    ${sheets}=  Get List Sheet Names

    Switch Current Excel Document  docid
    Get Sheet  ${sheets}[1]
    ${url}=  Read Excel Cell  row_num=2  col_num=2  sheet_name=${sheets}[1]
    ${browser}=  Read Excel Cell  row_num=2  col_num=3  sheet_name=${sheets}[1]
    ${testdata}  Read Excel Row  row_num=2  col_offset=0  max_num=0  sheet_name=${sheets}[1]
    Set Global Variable  ${testdata}
    Set Global Variable  ${HP_hotels}
    Set Global Variable  ${UC_signon}
    Set Global Variable  ${UC_return}
    Set Global Variable  ${LO_Button}
    Set Global Variable  ${FF_Continue}
    Set Global Variable  ${SF_Continue}
    Set Global Variable  ${BF_Continue}
    Set Global Variable  ${SO_return}
    Set Global Variable  ${L_register}
    Set Global Variable  ${HP_home}

    Open Browser  ${url}  ${browser}
    Sleep  3s
    Maximize Browser Window
    Log Title                                           #Capture and document window title


Stop Test
    [Arguments]  ${wnd_object}
    Click Link  ${HP_home}                     #Click the Logout button
    Close Browser
    Close All Excel Documents

Prepare For Page Change
    [Arguments]  ${wnd_name}  ${wnd_title}  ${wnd_object}
    ${var1}=  Run Keyword If  "${wnd_name}"=="Under Construction: Mercury Tours"  Run Keyword And Return  Switch Page1
    ...    ELSE IF  '${wnd_name}'=='Find a Flight: Mercury Tours: '  Run Keyword And Return  Check Login Status
    ...    ELSE IF  '${wnd_name}'=='Sign-on: Mercury Tours'  Run Keyword And Return  Switch Page2
    ...    ELSE IF  "${wnd_name}"=="Select a Flight: Mercury Tours"  Run Keyword And Return  Switch Page3
    ...    ELSE IF  "${wnd_name}"=="Book a Flight: Mercury Tours"  Run Keyword And Return  Switch Page4
    ...    ELSE IF  "${wnd_name}"=="Flight Confirmation: Mercury Tours"  Run Keyword And Return  Switch Page5
    ...    ELSE IF  "${wnd_name}"=="Cruises: Mercury Tours"  Run Keyword And Return  Switch Page6
    ...    ELSE IF  "${wnd_name}"=="Register: Mercury Tours"  Run Keyword And Return  Switch Page7
    ...    ELSE  Run Keyword And Return  Check Login Status


Switch Page1
    Run Keyword And Return  Click Link  ${HP_hotels}   #Link:Hotels

Switch Page2
    Run Keyword And Return  Click Link  ${UC_signon}   #Link:SIGN-ON

Switch Page3
    Run Keyword And Return  Click Element  ${FF_Continue}

Switch Page4
    Run Keyword And Return  Click Element  ${SF_Continue}

Switch Page5
    Run Keyword And Return  Click Element  ${BF_Continue}

Switch Page6
    Run Keyword And Return  Click Link  ${SO_return}

Switch Page7
    Run Keyword And Return  Click Link  ${L_register}

Send To Log
    [Arguments]  ${wnd_object}
    Log  ${wnd_object}                                  #Display value in the report

Verify Element
    [Arguments]  ${wnd_object}
    Page Should Contain Element  ${wnd_object}          #Existence test

Verify Button
    [Arguments]  ${wnd_object}
    Page Should Contain Button  ${wnd_object}           #Existence test

Verify Link
    [Arguments]  ${wnd_object}
    Page Should Contain Link  ${wnd_object}             #Existence test

Verify Image
    [Arguments]  ${wnd_object}
    Page Should Contain Image  ${wnd_object}             #Existence test

Verify Checkbox
    [Arguments]  ${wnd_object}
    Page Should Contain Checkbox  ${wnd_object}         #Existence test

Verify Radio Button
    [Arguments]  ${wnd_object}
    Page Should Contain Radio Button  ${wnd_object}     #Existence test

Verify Text Field
    [Arguments]  ${wnd_object}
    Page Should Contain Textfield  ${wnd_object}        #Existence test

Check Login Status
    Log  ${Login_status}
    ${var1}=  Run Keyword If  "${Login_status}"=="N"  Run Keyword And Return  Sign In New Tours
#    ${var2}=  Run Keyword If  "${wnd_name}"=="Select a Flight: Mercury Tours"  Click Element  ${FF_Continue}
#    ...    ELSE IF  "${wnd_name}"=="Book a Flight: Mercury Tours"  Click Element  ${SF_Continue}
#    ...    ELSE IF  "${wnd_name}"=="Flight Confirmation: Mercury Tours"  Click Element  ${BF_Continue}
#    ...    ELSE IF  "${wnd_name}"=="Cruises: Mercury Tours"  Click Link  ${SO_return}
#    ...    ELSE IF  "${wnd_name}"=="Register: Mercury Tours"  Click Link  ${L_register}


Sign In New Tours
    #${var1}=  Run Keyword If  "${wnd_name}"!="Sign-on: Mercury Tours"  Click Link  Link:SIGN-ON

    Wait Until Page Contains Element  ${wnd_object}[13]
    Input Text  ${wnd_object}[13]  ${testdata}[3]        #Email Entry Field
    Input Password  ${wnd_object}[14]  ${testdata}[4]    #Password Entry Field
    Page Should Contain Element  ${wnd_object}[15]       #Existence test for Sign In Button
    Click Element  ${wnd_object}[15]
    #Wait Until Page Contains Element  ${wnd_object}[25]  #findFlight button

    ${Login_status}=  Set Variable  Y
    Set Global Variable  ${Login_status}


