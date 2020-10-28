*** Settings ***
Library  SeleniumLibrary
Library  ExcelLibrary
Library  DataDriver    .xlsx
Library  Collections

*** Variables ***

${txt_title}  Fly with peace...
${book_title}   Flight Application | Next Gen Digital
${confirm_title}   Flight Application | Next Gen Digital



*** Keywords ***
Launch Test

    Open Excel Document  filename=C:/Users/wally/Documents/Python/Demo/TestSuite/NextGenDigital/BookFlightSanityTestCase.xlsx  doc_id=docid
    Get Sheet  sheet_name=REPO
    ${tc}=  Read Excel Column  col_num=1  row_offset=0  max_num=0  sheet_name=REPO
    ${wnd_name}=  Read Excel Column  col_num=2  row_offset=0  max_num=0  sheet_name=REPO
    ${wnd_object}=  Read Excel Column  col_num=3  row_offset=0  max_num=0  sheet_name=REPO
    Set Global Variable  ${wnd_object}
    ${obj_description}=  Read Excel Column  col_num=5  row_offset=0  max_num=0  sheet_name=REPO

    ${sheets}=  Get List Sheet Names

    Switch Current Excel Document  docid
    Get Sheet  ${sheets}[1]
    ${url}=  Read Excel Cell  row_num=2  col_num=2  sheet_name=${sheets}[1]
    ${browser}=  Read Excel Cell  row_num=2  col_num=3  sheet_name=${sheets}[1]
    ${testdata}  Read Excel Row  row_num=2  col_offset=0  max_num=0  sheet_name=${sheets}[1]


    Open Browser  ${url}  ${browser}
    Sleep  3s
    Maximize Browser Window
    Log Title                                           #Capture and document window title
    Select Frame  ${wnd_object}[1]                      #iFrame to access test fields - TC1
    Sleep  2s
    Input Text  ${wnd_object}[2]  ${testdata}[3]        #Email Entry Field - TC2
    Input Password  ${wnd_object}[3]  ${testdata}[4]    #Password Entry Field - TC3
    Page Should Contain Element  ${wnd_object}[4]       #Existence test for Sign In Button - TC4
    #Navigation from Login to Manage Booking
    Click Element  ${wnd_object}[4]                     #Sign In Button - TC4
    Sleep  2s
    Title Should Be  ${book_title}                      #Existence test for window title
    #Manage Booking navigation
    Page Should Contain Element  ${wnd_object}[5]       #Test iFrame for existence - TC5
    Select Frame  ${wnd_object}[5]                      #Second iFrame to access test fields - TC5
    Page Should Contain Element  ${wnd_object}[7]       #Existence test for Manage Booking button - TC7
    Click Button   ${wnd_object}[7]                     #Manage Booking button click - TC7

Stop Test
    [Arguments]  ${wnd_object}
    Click Element  ${wnd_object}[9]                     #Click the Logout button - TC9
    Close Browser
    Close All Excel Documents

Send To Log
    [Arguments]  ${wnd_object}
    Log  ${wnd_object}                                  #Display value in the report

Verify Element
    [Arguments]  ${wnd_object}
    Page Should Contain Element  ${wnd_object}          #Existence test

Verify Button
    [Arguments]  ${wnd_object}
    Page Should Contain Button  ${wnd_object}           #Existence test

Verify Checkbox
    [Arguments]  ${wnd_object}
    Page Should Contain Checkbox  ${wnd_object}         #Existence test

Verify Radio Button
    [Arguments]  ${wnd_object}
    Page Should Contain Radio Button  ${wnd_object}     #Existence test

Verify Test Field
    [Arguments]  ${wnd_object}
    Page Should Contain Textfield  ${wnd_object}        #Existence test