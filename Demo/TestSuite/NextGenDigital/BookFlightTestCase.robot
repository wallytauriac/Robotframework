*** Settings ***
Library  SeleniumLibrary            #Selenium Command Support
Library  ExcelLibrary               #Excel Command Support
Library  DataDriver    .xlsx        #Data Driven test Support
Library  Collections                #Operations to perform on Lists or Distionaries
Resource  ../../Resources/BookTestCommon.robot

#robot -d Results TestSuite/NextGenDigital/BookFlightTestCase.robot

Suite Setup  BookTestCommon.Launch Browser
Suite Teardown  BookTestCommon.Stop Browser
Test Setup  BookTestCommon.Launch Test  ${email}  ${psw}
Test Teardown  BookTestCommon.Stop Test
Test Template  Book Flight Scenarios

*** Test Cases ***
Verify Book Flight for TestCase - ${testcase} - ${description}



*** Keywords ***
Book Flight Scenarios
    [Arguments]  ${testcase}  ${emsg}

    Title Should Be  ${Book_title}
    Select Frame  //*[@id="iframe-115"]
    Click Button  //*[@name="Booking"]
    Run Keyword If  "${testcase}"=="TC100"  Click Element  ${chk_roundtrip}        #TC100 - Set Round Trip Flight On
...    ELSE IF  "${testcase}"=="TC120"  Click Element  ${chk_roundtrip}            #TC120 - Set Round Trip Flight On
...    ELSE IF  "${testcase}"=="TC130"  Click Element  ${rad_flighthotel}          #TC130 - One way Flight w/ Hotel
...    ELSE  No Operation

    Run Keyword If  "${testcase}"=="TC100"  Click Element  ${rad_flight}           #TC100 - Set Flight Only
...    ELSE  No Operation

    Run Keyword If  "${testcase}"=="TC110"  Click Element  ${rad_flight}           #TC110 - Set Flight Only
...    ELSE  No Operation

    Run Keyword If  "${testcase}"=="TC120"  Click Element  ${rad_flighthotel}      #TC120 - Round Trip w/ Hotel
...    ELSE  No Operation

    Click Button  ${btn_getfare}
    Current Frame Should Contain  ${emsg}  loglevel=INFO
    #Sleep  3s