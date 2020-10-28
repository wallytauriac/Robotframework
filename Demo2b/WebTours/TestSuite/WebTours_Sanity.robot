*** Settings ***
Library  SeleniumLibrary            #Selenium Command Support
Library  ExcelLibrary               #Excel Command Support
Library  DataDriver    .xlsx        #Data Driven test Support
Library  Collections                #Operations to perform on Lists or Distionaries
Resource  ../Resources/WebTours_Common.robot

#robot -d WebTours/Results WebTours/TestSuite/WebTours_sanity.robot

Suite Setup  WebTours_Common.Launch Test
Suite Teardown  WebTours_Common.Stop Test

Test Template  Sanity Test Web Tours

*** Variables ***
${passed}  True
${iframe}  N
*** Test Cases ***
Web Tours Page Object Tests - ${tc} - ${obj_description}

*** Keywords ***
Sanity Test Web Tours
    [Arguments]  ${tc}   ${wnd_label}     ${wnd_object}   ${objecttype}   ${frame}
    # Run Short Test Cycle
    Log  ${tc}
    #${var0}=  Run Keyword If  "${tc}"=="TC55"  Fatal Error  Test Premature End
    # End of Short Cycle
    # Process Frame Control
    #${var1}=  Run Keyword If  "${iframe}"!="${frame}"  Select Frame Area  ${frame}
    ${var1}=  Run Keyword If  "${iframe}"!="${frame}"  Set iFrame Value  ${frame}
    Log  ${iframe}
    # End of Frame Control
    # Test Control Processing
    Log  ${wnd_title}
    Log  ${wnd_label}
    ${var1}=  Run Keyword If  "${wnd_label}"=="${wnd_title}"  No Operation
    ${var1}=  Run Keyword If  "${wnd_label}"!="${wnd_title}"  WebTours_Common.Prepare For Page Change  ${wnd_label}  ${wnd_title}  ${wnd_object}
    ${wnd_title}=  Set Variable  ${wnd_label}
    Set Global Variable  ${wnd_title}
    Log  ${wnd_title}
    Log  ${wnd_label}
    ${var2}=  Run Keyword If  "${objecttype}"=="Log"  WebTours_Common.Send To Log  ${wnd_object}
    ...    ELSE IF  '${objecttype}'=='Element'  WebTours_Common.Verify Element  ${wnd_object}
    ...    ELSE IF  '${objecttype}'=='Click Element'  WebTours_Common.Verify Element  ${wnd_object}
    ...    ELSE IF  '${objecttype}'=='Button'  WebTours_Common.Verify Button  ${wnd_object}
    ...    ELSE IF  '${objecttype}'=='Checkbox'  WebTours_Common.Verify Checkbox  ${wnd_object}
    ...    ELSE IF  '${objecttype}'=='Radio'  WebTours_Common.Verify Radio Button  ${wnd_object}
    ...    ELSE IF  '${objecttype}'=='Link'  WebTours_Common.Verify Link  ${wnd_object}
    ...    ELSE IF  '${objecttype}'=='Image'  WebTours_Common.Verify Image  ${wnd_object}
    ...    ELSE IF  '${objecttype}'=='Frame'  WebTours_Common.Send To Log  ${wnd_object}
    ...    ELSE IF  '${objecttype}'=='Select'  WebTours_Common.Send To Log  ${wnd_object}
    ...    ELSE  WebTours_Common.Verify Text Field  ${wnd_object}

    Log Title
    Pass Execution  "Test Completed"

Select Frame Area
    [Arguments]  ${frame}
    ${varx}=  Run Keyword If  "${frame}"=="L"  Select Left Panel Frame
    ${vary}=  Run Keyword If  "${frame}"=="R"  Select Right Panel Frame

Set iFrame Value
    [Arguments]  ${frame}
    ${iframe}=  Set Variable  ${frame}
    Set Global Variable  ${iframe}