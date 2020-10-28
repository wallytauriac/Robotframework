*** Settings ***
Library  SeleniumLibrary            #Selenium Command Support
Library  ExcelLibrary               #Excel Command Support
Library  DataDriver    .xlsx        #Data Driven test Support
Library  Collections                #Operations to perform on Lists or Distionaries
Resource  ../Resources/SanityCommon.robot


Suite Setup  SanityCommon.Launch Test
Suite Teardown  SanityCommon.Stop Test  ${wnd_object}

Test Template  Sanity Test New Tours

*** Variables ***
${passed}  True

*** Test Cases ***
Tours Page Object Tests - ${tc} - ${obj_description}

*** Keywords ***
Sanity Test New Tours
    [Arguments]  ${tc}   ${wnd_name}     ${wnd_object}   ${objecttype}
    ${wnd_title}=  Get Title
    ${var1}=  Run Keyword If  "${wnd_name}"=="${wnd_title}"  No Operation
    ${var1}=  Run Keyword If  "${wnd_name}"!="${wnd_title}"  SanityCommon.Prepare For Page Change  ${wnd_name}  ${wnd_title}  ${wnd_object}
    #...    ELSE  Run Keyword  Sanity Test Part 2  ${tc}   ${wnd_name}     ${wnd_object}   ${objecttype}

#Sanity Test Part 2
#    [Arguments]  ${tc}   ${wnd_name}     ${wnd_object}   ${objecttype}
    ${var2}=  Run Keyword If  "${objecttype}"=="Log"  SanityCommon.Send To Log  ${wnd_object}
    ...    ELSE IF  '${objecttype}'=='Element'  SanityCommon.Verify Element  ${wnd_object}
    ...    ELSE IF  '${objecttype}'=='Click Element'  SanityCommon.Verify Element  ${wnd_object}
    ...    ELSE IF  '${objecttype}'=='Button'  SanityCommon.Verify Button  ${wnd_object}
    ...    ELSE IF  '${objecttype}'=='Checkbox'  SanityCommon.Verify Checkbox  ${wnd_object}
    ...    ELSE IF  '${objecttype}'=='Radio'  SanityCommon.Verify Radio Button  ${wnd_object}
    ...    ELSE IF  '${objecttype}'=='Link'  SanityCommon.Verify Link  ${wnd_object}
    ...    ELSE IF  '${objecttype}'=='Image'  SanityCommon.Verify Image  ${wnd_object}
    ...    ELSE  SanityCommon.Verify Text Field  ${wnd_object}

    Log Title
    Pass Execution  "Test Completed"