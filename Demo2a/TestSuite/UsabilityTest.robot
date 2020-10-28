*** Settings ***
Library  Selenium2Library

# Script is designed to explore two websites and do object identification
# The script revealed a problem with the Internet Explorer browser, presently.

# Latest website for recent IE drivers
#http://selenium-release.storage.googleapis.com/index.html?path=3.150/

*** Variables ***
${url1}  https://google.com
${srch_value}  selenium
${xpath1_search}  //*[@id="tsf"]/div[2]/div[1]/div[1]/div/div[2]/input
${xpath2_search}  name:q
${xpath3_search}  //input[@name='q']
${xpath1_srchbtn}  //*[@id="tsf"]/div[2]/div[1]/div[3]/center/input[1]
${xpath2_srchbtn}  name:btnK
${xpath3_srchbtn}  //input[@name='btnK']
${xpath2_gimg}     id:hplogo
${url2}  https://yahoo.com
${browser}  chrome

#   Execution Options
#robot -d R5_Usability TestSuite/UsabilityTest.robot
#robot -d R6_Usability --variable browser:firefox TestSuite/UsabilityTest.robot
#robot -d R7_Usability --variable browser:ie TestSuite/UsabilityTest.robot

*** Test Cases ***
Test Existence WebSite 1
    Start Test  ${url1}
    Sleep  2s
    Verify Search
    Sleep  3s
    End Test
Test Existence WebSite 2
    Start Test  ${url2}
    Sleep  3s
    End Test


*** Keywords ***
Start Test
    [Arguments]  ${url}
    Open Browser  ${url}  ${browser}  # IE does not attach to the open window for object identification
    Log  ${url}
    Log  ${browser}

End Test
    Close Browser  #Tried Close All and Close Window for IE, not working

Verify Search
    Get Window Titles
    Page Should Contain Element  ${xpath1_search}
    Page Should Contain Element  ${xpath2_search}
    Page Should Contain Button  ${xpath1_srchbtn}
    Page Should Contain Button  ${xpath2_srchbtn}
    Input Text  ${xpath2_search}  ${srch_value}
    ${var2}=  Run Keyword If  "${browser}"=="firefox"    Search Click
    ...    ELSE  Click Button  ${xpath2_srchbtn}
    Get Window Titles


Search Click
    Click Element  ${xpath2_gimg}    #click on Google image to clear search box pulldown menu
    Set Focus To Element  ${xpath2_srchbtn}
    Scroll Element Into View  ${xpath2_search}
    Click Element  ${xpath2_gimg}
    Sleep  3s
    Click Element  ${xpath1_srchbtn}
    #Return From Keyword
    # You May encounter a BrokenPipeError while using selenium and chromedriver
    # A suggested fix is to Quit()... but that translates in Robot Framework as Close Browser
    # The Return From Keyword forces return to Verify Search and ultimately to the End Test *** keywords ***

#For IE 11 only, you will need to set a registry entry on the target computer so that the driver can maintain a connection to the instance of Internet Explorer it creates. For 32-bit Windows installations, the key you must examine in the registry editor is HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BFCACHE. For 64-bit Windows installations, the key is HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BFCACHE. Please note that the FEATURE_BFCACHE subkey may or may not be present, and should be created if it is not present. Important: Inside this key, create a DWORD value named iexplore.exe with the value of 0.