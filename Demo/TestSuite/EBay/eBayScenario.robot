*** Settings ***
Library          SeleniumLibrary
Documentation    Suite description
...              Main test case file for eBay Acceptance Testing


Resource  ../../Resources/eBayTest2.robot
Resource  ../../Resources/eBayVariable2.robot

#robot -d Results TestSuite/eBay/eBayScenario.robot

Test Setup  eBayTest2.Launch Browser
Test Teardown  eBayTest2.Stop Browser

*** Variables ***

*** Test Cases ***
Customer Services Scenario
    [Documentation]  eBay test to verify customer services processing
    [Tags]  Customer

    eBayTest2.Customer Services

Search Services Scenario
    [Documentation]  eBay test to verify product search processing
    [Tags]  Search

    eBayTest2.Search Services


Visitor Services Scenario
    [Documentation]  eBay test to verify visitor functionality
    [Tags]  Visitor

    eBayTest2.Visitor Services
    eBayTest2.Stop Browser