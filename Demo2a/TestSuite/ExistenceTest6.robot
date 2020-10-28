*** Settings ***
Library  SeleniumLibrary

# Script is designed to test two websites in sequence. A different browser can be selected.

*** Variables ***
${url1}  http://www.google.com
${url2}  http://www.yahoo.com
${browser}  chrome

#   Execution Options
#robot -d R3_ExistenceTest6 TestSuite/ExistenceTest6.robot
#robot -d R4_ExistenceTest6 --variable browser:firefox TestSuite/ExistenceTest6.robot

*** Test Cases ***
Test Existence WebSite 1
    Start Test  ${url1}
    Sleep  3s
    End Test
Test Existence WebSite 2
    Start Test  ${url2}
    Sleep  3s
    End Test


*** Keywords ***
Start Test
    [Arguments]  ${url}
    Open Browser  ${url}  ${browser}  alias-Edge
    Log  ${url}
    Log  ${browser}

End Test
    Close Browser
