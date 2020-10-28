*** Settings ***
Documentation     A test suite with a single test for Electronics, Cars, Fashion, Collectibles & More | eBay
...               Created by hats' Robotcorder
...               General Visitor Services Testing
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3
${obj_motors}  xpath=(//a[@href="https://www.ebay.com/b/Auto-Parts-and-Vehicles/6000/bn_1865334"])[2]  # Motors Home Bar Link
${obj_title}  xpath=//span[@class="b-pageheader__text"]  # Page title
${obj_fashion}  xpath=(//a[@href="https://www.ebay.com/b/Fashion/bn_7000259856"])[2]
${obj_electron}  xpath=(//a[@href="https://www.ebay.com/b/Electronics/bn_7000259124"])[2]
${obj_deals}  xpath=(//a[@href="https://www.ebay.com/deals"])[2]
${obj_music}  xpath=(//a[@href="https://www.ebay.com/b/Music/bn_7000710860"])[2]
${obj_bcrumb}  css:body > div.pagecontainer.srp-main--isLarge > div.pagecontainer__top > nav > ol > li:nth-child(1) > a
${obj_title2}  xpath=//*[@id="refit-spf-container"]/div[1]/h1/a  # Deal page title
${obj_title3}  xpath=//*[@id="s0-15-6-0-1[1]-0"]/div[1]/div[2]/h1  # Music page title

*** Test Cases ***
Visitor Services Scenario
    Set Selenium Speed  1 seconds
    Open Browser    https://www.ebay.com/    ${BROWSER}
    Maximize Browser Window
    Click Link    ${obj_motors}
    Element Should Contain  ${obj_title}  eBay Motors
    ${passed}=  Run Keyword And Return Status  Set Focus To Element  ${obj_bcrumb}
    Run Keyword If  ${passed}  Log  Breadcrumb List is present  level=INFO
    ...      ELSE  Log  Breadcrumb List missing  level=WARN

    Go Back
    Click Link    ${obj_fashion}
    Element Should Contain    ${obj_title}  Fashion
    ${passed}=  Run Keyword And Return Status  Set Focus To Element  ${obj_bcrumb}
    Run Keyword If  ${passed}  Log  Breadcrumb List is present  level=INFO
    ...      ELSE  Log  Breadcrumb List missing  level=WARN

    Go Back
    Click Link    ${obj_electron}
    Element Should Contain  ${obj_title}  Electronics
    ${passed}=  Run Keyword And Return Status  Set Focus To Element  ${obj_bcrumb}
    Run Keyword If  ${passed}  Log  Breadcrumb List is present  level=INFO
    ...      ELSE  Log  Breadcrumb List missing  level=WARN

    Go Back
    # The following pages are missing breadcrumb trail
    # We could test for that condition
    # /html/body/div[3]/div[2]/nav/ol/li[1]/a
    # css:body > div.pagecontainer.srp-main--isLarge > div.pagecontainer__top > nav > ol > li:nth-child(1) > a
    Click Link    ${obj_deals}
    Element Should Contain  ${obj_title2}  Deals

    ${passed}=  Run Keyword And Return Status  Set Focus To Element  ${obj_bcrumb}
    Run Keyword If  ${passed}  Log  Breadcrumb List is present  level=INFO
    ...      ELSE  Log  Breadcrumb List missing  level=WARN

    Go Back
    Click Link  ${obj_music}
    Element Should Contain  ${obj_title3}  Music
    ${passed}=  Run Keyword And Return Status  Set Focus To Element  ${obj_bcrumb}
    Run Keyword If  ${passed}  Log  Breadcrumb List is present  level=INFO
    ...      ELSE  Log  Breadcrumb List missing  level=WARN

    Go Back

    Close Browser