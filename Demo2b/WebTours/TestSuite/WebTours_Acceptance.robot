*** Settings ***
Library  SeleniumLibrary            #Selenium Command Support
Library  ExcelLibrary               #Excel Command Support
Library  DataDriver    .xlsx        #Data Driven test Support
Library  Collections                #Operations to perform on Lists or Distionaries
Resource  ../Resources/WebTours_AcptCommon.robot

#robot -d WebTours/Results2 WebTours/TestSuite/WebTours_Acceptance.robot

Suite Setup  WebTours_AcptCommon.Launch Test
Suite Teardown  WebTours_AcptCommon.Stop Test

Test Template  Web Tours Acceptance Tests

*** Variables ***
${passed}  True


*** Test Cases ***
Acceptance Tests - ${tc} - ${description}

*** Keywords ***
Web Tours Acceptance Tests
    [Arguments]  ${tc}  ${description}  ${username}  ${psw}
    ${var2}=  Run Keyword If  "${tc}"=="TC100"  WebTours_AcptCommon.Administration
    ...    ELSE IF  "${tc}"=="TC110"  WebTours_AcptCommon.Book Single Flight - One way  ${username}  ${psw}
    ...    ELSE IF  "${tc}"=="TC120"  WebTours_AcptCommon.Book Single Flight - Round Trip  ${username}  ${psw}
    ...    ELSE IF  "${tc}"=="TC130"  WebTours_AcptCommon.Update Flight  ${username}  ${psw}
    ...    ELSE IF  "${tc}"=="TC140"  WebTours_AcptCommon.Check Itenerary  ${username}  ${psw}
    ...    ELSE IF  "${tc}"=="TC150"  WebTours_AcptCommon.Verify Home page  ${username}  ${psw}
    ...    ELSE IF  "${tc}"=="TC160"  WebTours_AcptCommon.Check Invalid Login  ${username}  ${psw}
    ...    ELSE IF  "${tc}"=="TC170"  WebTours_AcptCommon.Cancel Flights  ${username}  ${psw}
    ...    ELSE IF  "${tc}"=="TC180"  WebTours_AcptCommon.Sign up  ${username}  ${psw}
    ...    ELSE  WebTours_AcptCommon.Invalid Test Case  ${tc}  ${description}

    Log Title
    Pass Execution  "Test Completed"