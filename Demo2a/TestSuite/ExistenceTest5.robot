*** Settings ***
Library  SeleniumLibrary

# Script is designed to test the existence of a single website.

*** Variables ***
${url}  http://www.google.com
${browser}  chrome

#   Execution Options
#robot -d R1_ExistenceTest5 TestSuite/ExistenceTest5.robot
#robot -d R2_ExistenceTest5 --variable url:http://www.yahoo.com TestSuite/ExistenceTest5.robot

*** Test Cases ***
Test Existence of website
    Start Test
    Sleep  3s
    End Test


*** Keywords ***
Start Test
    Open Browser  ${url}  ${browser}
    Log  ${url}
    Log  ${browser}

End Test
    Close Browser
