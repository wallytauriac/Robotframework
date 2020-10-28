*** Settings ***
Resource  ../../Resources/Chrome.robot
Resource  ../../Resources/eBayTests.robot
Resource  ../../Resources/eBayVariables.robot

#robot -d Results TestSuite/eBay/eBaySearch.robot

Test Setup  Chrome.Launch Browser
Test Teardown  Chrome.Stop Browser

*** Variables ***

*** Test Cases ***
Verify eBay Search 1
    [Documentation]  eBay test
    [Tags]  Regression1
    # General Customer Services Testing
    # Search Services Scenario Testing
    # General Visitor Services Testing
    eBayTests.Test Search  ${search_text}[0]
    eBayTests.Filter Results
    eBayTests.Verify Filter

Verify eBay Search 2
    [Documentation]  eBay test
    [Tags]  Regression2

    eBayTests.Test Search  ${search_text}[1]
    eBayTests.Filter Results
    eBayTests.Verify Filter

Verify eBay Search 3
    [Documentation]  eBay test
    [Tags]  Regression3

    eBayTests.Test Search  ${search_text}[2]
    eBayTests.Filter Results
    eBayTests.Verify Filter

