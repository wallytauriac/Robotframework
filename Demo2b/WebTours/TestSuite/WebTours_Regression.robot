*** Settings ***
Library  SeleniumLibrary            #Selenium Command Support
Library  ExcelLibrary               #Excel Command Support
Library  DataDriver    .xlsx        #Data Driven test Support
Library  Collections                #Operations to perform on Lists or Distionaries
Resource  ../Resources/WebTours_RegrCommon.robot
Resource  ../Resources/WebTours_Whitebox.robot

#robot -d WebTours/Results1 WebTours/TestSuite/WebTours_Regression.robot

Suite Setup  WebTours_RegrCommon.Launch Test
Suite Teardown  WebTours_RegrCommon.Stop Test

Test Template  Web Tours Regression Tests

*** Variables ***
${passed}  True


*** Test Cases ***
Regression Tests - ${tc} - ${description}

*** Keywords ***
Web Tours Regression Tests
    [Arguments]  ${tc}  ${description}  ${data1}  ${data2}  ${data3}  ${data4}  ${data5}  ${data6}  ${data7}
    ${var2}=  Run Keyword If  "${tc}"=="TC001"  WebTours_RegrCommon.Create Flight
    ...    ELSE IF  "${tc}"=="TC002"  WebTours_RegrCommon.Check Itenerary And Cancel
    ...    ELSE IF  "${tc}"=="TC003"  WebTours_RegrCommon.Verify Pages
    ...    ELSE IF  "${tc}"=="TC004"  WebTours_RegrCommon.Check Flights
    ...    ELSE IF  "${tc}"=="TC005"  WebTours_RegrCommon.Invalid Login Tests
    ...    ELSE IF  "${tc}"=="TC006"  WebTours_Whitebox.Verify Flight Prices  ${data1}  ${data2}  ${data3}  ${data4}  ${data5}  ${data6}  ${data7}
    ...    ELSE  WebTours_RegrCommon.Invalid Test Case  ${tc}  ${description}

    Log Title
    Pass Execution  "Test Completed"