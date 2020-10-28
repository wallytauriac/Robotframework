*** Settings ***
Library  Selenium2Library

# Script is designed to test IE and EDGE browsers - IE is failing

#                OPEN SOURCE CONCERN
#   (This can get costly in the real world - a workaround is important)
# Did research for several days to find resolution, but unsuccessful
# There were some responses to the problem, but their resolutions were unsuccessful

#   Execution Options
#robot -d R8_testIE TestSuite/testIE.robot
#robot -d R9_testIE --include smoke TestSuite/testIE.robot

*** Variables ***
${url}  http://www.google.com/
${browser1}  edge
${browser2}  ie
#     CSS Selector example which can be used instead of XPATH definitions
#${xpath1_search}  css:form#tsf > div > div.A8SBwf > div.RNNXgb > div.SDkEP > div.a4blc > input.gLFyf
${xpath1_search}  name:q

#     Pointer to EDGE driver for browser testing
#https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/  Edge Driver

*** Test Cases ***
Test Edge Browser
    [Tags]  smoke
    Start Test  ${browser1}
    Sleep  3s
    End Test

Test Internet Explorer Browser
    Start Test  ${browser2}
    Sleep  3s
    End Test

*** Keywords ***
Start Test
    [Arguments]  ${browser}
    Open Browser  about:blank  ${browser}
    Go To  ${url}
    Wait Until Element Is Visible  ${xpath1_search}  5s
    Get Window Titles
    Log  ${url}
    Log  ${browser}
    Page Should Contain Element  ${xpath1_search}


End Test
    Close Browser