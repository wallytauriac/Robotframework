*** Settings ***
Library  SeleniumLibrary            #Selenium Command Support
Library  ExcelLibrary               #Excel Command Support
Library  DataDriver    .xlsx        #Data Driven test Support
Library  Collections                #Operations to perform on Lists or Distionaries
Resource  ../../Resources/BookFlightSanityCommon.robot


Suite Setup  BookFlightSanityCommon.Launch Test
Suite Teardown  BookFlightSanityCommon.Stop Test  ${wnd_object}
Test Template  Book Flight Sanity Test

*** Test Cases ***
Book Flight Test Case - ${tc} - ${obj_description}



*** Keywords ***
Book Flight Sanity Test
    [Arguments]  ${tc}   ${wnd_name}     ${wnd_object}   ${objecttype}

    Run Keyword If  "${objecttype}"=="Log"  BookFlightSanityCommon.Send To Log  ${wnd_object}
...    ELSE IF  '${objecttype}'=='Element'  BookFlightSanityCommon.Verify Element  ${wnd_object}
...    ELSE IF  '${objecttype}'=='Button'  BookFlightSanityCommon.Verify Button  ${wnd_object}
...    ELSE IF  '${objecttype}'=='Checkbox'  BookFlightSanityCommon.Verify Checkbox  ${wnd_object}
...    ELSE IF  '${objecttype}'=='Radio'  BookFlightSanityCommon.Verify Radio Button  ${wnd_object}
...    ELSE  BookFlightSanityCommon.Verify Text Field  ${wnd_object}

    Log Title
    Pass Execution  "Test Completed"