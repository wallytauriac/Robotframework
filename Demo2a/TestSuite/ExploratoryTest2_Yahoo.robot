*** Settings ***
Library  Selenium2Library

# Script is designed to explore YAHOO.COM and do object identification

Suite Setup  Start Test
Suite Teardown  Close Browser

#robot -d Results TestSuite/ExploratoryTest2_Yahoo.robot
#robot -d Results --variable browser:firefox TestSuite/ExploratoryTest2_Yahoo.robot
#robot -d Results --include TYPO TestSuite/ExploratoryTest2_Yahoo.robot
#robot -d Results --include TYHL TestSuite/ExploratoryTest2_Yahoo.robot
#robot -d Results --include TYNL TestSuite/ExploratoryTest2_Yahoo.robot
#robot -d Results --include TYSL TestSuite/ExploratoryTest2_Yahoo.robot

*** Variables ***
${delay}  2s
${url1}  http://www.yahoo.com
${srch_value}  selenium
${browser}  chrome
#  Header Bar Links
${hdr_logo}  id:header-logo  #Yahoo logo - click to refresh window
${hdr_signin}  id:header-signin-link  #Link to Sign-in page
${hdr_mail1}  id:header-mail-button  #Link to Mail login
${hdr_mail2}  xpath://*[@id="header-nav-bar"]/li[1]/a[1]  #Mail link
${hdr_search1}  css:#header-search-input
${hdr_search2}  id:header-search-input
${hdr_search3}  xpath://*[@id="header-search-input"]  #Search input text box
${hdr_srchbtn1}  id:header-desktop-search-button
${hdr_srchbtn2}  xpath://*[@id="header-desktop-search-button"]  #Search button
${hdr_srchbtn3}  css:#header-nav-bar > li:nth-child(1) > a
# News Links
${news_trend1}  xpath://*[@id="applet_p_50000352"]/div[1]/div[1]/h4[1]/span[1]  #Trending Now
${news_trend2}  css:div#applet_p_50000352 > div > div > h4 > span  #Trending Now Link
#${news_trend3}  xpath://*[@id="applet_p_50000352"]/div[1]/div[1]/ul[1]/li[1]/ul[1]/li[1]/a[1]/span[2]  #Jillian Trending news
#${news_trend3a}  css:#div#applet_p_50000352 > div > div > ul > li > ul > li > a > span:nth-of-type(2)  #Jillian Trending news
${news_trend3}  xpath://*[@id="applet_p_50000352"]/div[1]/div[1]/ul[1]/li[1]/ul[1]/li[1]/a[1]/span[2]  #Beirut explosion
${news_trend3a}  css:div#applet_p_50000352 > div > div > ul > li > ul > li > a > span:nth-of-type(2)  #Beirut explosion
# Story Links
${stry_top1}  xpath://*[@id="applet_p_50000313"]/div[1]/div[1]/div[1]/div[1]/div[1]/a[1]/div[2]/div[1]  #Top Story Link
${stry_top2}  css:div#applet_p_50000313 > div > div > div > div > div > a > div:nth-of-type(2) > div  #Top Story Link
${stry_lnk1}  xpath://*[@id="applet_p_50000313"]/div[1]/div[1]/div[2]/ul[1]/li[1]/div[1]/a[1]/img[1]  #Story Link 1
${stry_lnk1a}  css:div#applet_p_50000313 > div > div > div:nth-of-type(2) > ul > li > div > a > img  #Story Link 1
${stry_lnk2}  xpath://*[@id="applet_p_50000313"]/div[1]/div[1]/div[2]/ul[1]/li[2]/div[1]/a[1]/img[1]  #Story Link 2
${stry_lnk2a}  css:div#applet_p_50000313 > div > div > div:nth-of-type(2) > ul > li:nth-of-type(2) > div > a > img  #Story Link 2

*** Test Cases ***
Test YAHOO Page Objects
    [Tags]  TYPO
    Examine objects

Test YAHOO Header Links
    [Tags]  TYHL
    Test Header Links

Test YAHOO News Links
    [Tags]  TYNL
    Test News Links

Test YAHOO Story Links
    [Tags]  TYSL
    Test Story Links


*** Keywords ***
Start Test
    Open Browser  ${url1}  ${browser}
    Maximize Browser Window
    Log  ${url1}
    Log  ${browser}



End Test
    Close Browser  #Tried Close All and Close Window for IE, not working

Examine objects
    Get Window Titles
    @{list}=  Get All Links     #Get a list of links on the page
    @{list2}=  Get Browser Ids  #Get a list of active browsers
    #  Header Bar Links
    Page Should Contain Element  ${hdr_logo}  #Yahoo logo - click to refresh window
    Page Should Contain Element  ${hdr_signin}  #Link to Sign-in page
    Page Should Contain Element  ${hdr_mail1}  #Link to Mail login
    Page Should Contain Element  ${hdr_mail2}  #Mail link
    Page Should Contain Element  ${hdr_search1}  #Search input text box
    Page Should Contain Element  ${hdr_search2}  #Search input text box
    Page Should Contain Element  ${hdr_search3}  #Search input text box
    Page Should Contain Element  ${hdr_srchbtn1}  #Search button
    Page Should Contain Element  ${hdr_srchbtn2}  #Search button
    Page Should Contain Element  ${hdr_srchbtn3}  #Search button

    # Invalid Element Definitions
    #Page Should Contain Element  //*[@id="header-desktop-search-button"]/svg[1]  #Search button
    #Page Should Contain Element  //*[@id="sdarla_closed_my-adsMAST-iframe"]  # Ads Close button
    #Page Should Contain Element  css:div#sdarla_closed_my-adsMAST-iframe  # Ads Close button
    #Page Should Contain Element  css:iframe#my-adsMAST-iframe  # Ads iframe area

    # News Links
    Page Should Contain Element  ${news_trend1}  #Trending Now
    Page Should Contain Element  ${news_trend2}  #Trending Now Link
    Page Should Contain Element  ${news_trend3}  #Trending Now Jillian Link
    #Page Should Contain Element  ${news_trend3a}  #Trending Now Jillian Link

    # Story Links
    Page Should Contain Element  ${stry_top1}  #Top Story Link
    Page Should Contain Element  ${stry_top2}  #Top Story Link
    Page Should Contain Element  ${stry_lnk1}  #Story Link 1
    Page Should Contain Element  ${stry_lnk1a}  #Story Link 1
    Page Should Contain Element  ${stry_lnk2}  #Story Link 2
    Page Should Contain Element  ${stry_lnk2a}  #Story Link 2

Test Header Links
    Sleep  ${delay}
    Click Element  ${hdr_logo}  #Yahoo logo - click to refresh window
    Click Object  ${hdr_signin}  #Link to Sign-in page
    Click Object  ${hdr_mail1}  #Link to Mail login
    #Click Object  ${hdr_mail2}  #Mail link
    Verify Search  ${hdr_search1}  ${hdr_srchbtn1}  ${srch_value}
    Verify Search  ${hdr_search1}  ${hdr_srchbtn2}  ${srch_value}
    Verify Search  ${hdr_search1}  ${hdr_srchbtn3}  ${srch_value}
    Verify Search  ${hdr_search2}  ${hdr_srchbtn1}  ${srch_value}
    Verify Search  ${hdr_search2}  ${hdr_srchbtn2}  ${srch_value}
    Verify Search  ${hdr_search2}  ${hdr_srchbtn3}  ${srch_value}
    Verify Search  ${hdr_search3}  ${hdr_srchbtn1}  ${srch_value}
    Verify Search  ${hdr_search3}  ${hdr_srchbtn2}  ${srch_value}
    Verify Search  ${hdr_search3}  ${hdr_srchbtn3}  ${srch_value}

Test News Links
    Click Element  ${news_trend1}  #Trending Now
    Click Element  ${news_trend2}  #Trending Now Link
    Click Object  ${news_trend3}  #Trending Now Link 1
    #Click Object  ${news_trend3a}  #Trending Now Link 1


Test Story Links
    Click Object  ${stry_top1}  #Top Story Link
    Click Object  ${stry_top2}  #Top Story Link
    Click Object  ${stry_lnk1}  #Story Link 1
    Click Object  ${stry_lnk1a}  #Story Link 1
    Click Object  ${stry_lnk2}  #Story Link 2
    Click Object  ${stry_lnk2a}  #Story Link 2

Click Object
    [Arguments]  ${Element}    #
    Sleep  ${delay}
    Log  ${Element}
    Click Element  ${Element}
    Go Back

Verify Search
    [Arguments]  ${Element}  ${Button}  ${Value}   #
    Sleep  ${delay}
    Builtin.Log  ${Element}
    Builtin.Log  ${Value}
    Builtin.Log  ${Button}
    ${passed}=  Run Keyword And Return Status  Set Focus To Element  ${Element}
    Run Keyword If  ${passed}  Input Text  ${Element}  ${Value}
    ${passed}=  Run Keyword And Return Status  Set Focus To Element  ${Button}
    Run Keyword If  ${passed}  Click Element  ${Button}
    Go Back