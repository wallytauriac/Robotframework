*** Settings ***
Library          SeleniumLibrary
Library          ExcelLibrary
Library          DataDriver  .xlsx   sheet_name=${sheet}
Documentation    Suite description
Resource         ../../Resources/eBayTestX.robot
Resource         ../../Resources/eBayVariable2.robot

#                Main test case file for eBay Acceptance Testing

#robot -d Results TestSuite/eBay/eBayScenarioX.robot
#robot -d Results --variables brwsr:firefox TestSuite/eBay/eBayScenarioX.robot
#robot -d Results --variables sheet:REPO2 TestSuite/eBay/eBayScenarioX.robot

Suite Setup  eBayTestX.Launch Excel   ${sheet}
Test Setup  eBayTestX.Launch Browser  ${brwsr}
Test Teardown  eBayTestX.Stop Browser
Suite Teardown  eBayTestX.Stop Suite

Test Template  eBay Test Scenarios

*** Variables ***
${brwsr}  chrome
${sheet}  REPO

*** Test Cases ***
eBay Acceptance Tests - ${TC} - ${WND_ONAME}
    [Documentation]  ${DOC}

*** Keywords ***
eBay Test Scenarios
    [Arguments]  ${TC}  ${TCAT}  ${WND_ONAME}
    #  Customer Services Scenario
    #     eBay test to verify customer services processing
    #  else Search Services Scenario
    #     eBay test to verify product search processing
    #  else Visitor Services Scenario
    #     eBay test to verify visitor functionality

    Run Keyword If  "${TCAT}"=="Customer"  eBayTestX.Customer Services  ${WND_ONAME}
    ...     ELSE IF  "${TCAT}"=="Search"  eBayTestX.Search Services  ${WND_ONAME}
    ...     ELSE IF  "${TCAT}"=="Visitor"  eBayTestX.Visitor Services  ${WND_ONAME}