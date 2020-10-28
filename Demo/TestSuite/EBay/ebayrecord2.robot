*** Settings ***
Documentation     A test suite with a single test for Electronics, Cars, Fashion, Collectibles & More | eBay
...               Created by hats' Robotcorder
...               Search Services Scenario Testing
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3
${btn_condition}  xpath=(//span[@class="expand-btn__cell"])[2]  # Condition Pulldown
${btn_delivery}  xpath=(//span[@class="expand-btn__cell"])[3]  # Delivery Options Pulldown
${btn_match}  xpath=(//span[@class="expand-btn__cell"])[4]  # Match Pulldown
${btn_views}  xpath=(//span[@class="expand-btn__cell"])[5]  # Views Pulldown
${btn_shop}  xpath=//i[@id="gh-shop-ei"]  # Shop by Category Pulldown

*** Test Cases ***
Search Services Scenario
    Set Selenium Speed  1 seconds
    Open Browser    https://www.ebay.com/    ${BROWSER}
    Maximize Browser Window
    Input Text    //input[@name="_nkw"]    mobile
    Click Element    //input[@id="gh-btn"]
    # Results for Mobile search
    Validate Pulldown Button  ${btn_condition}  # Condition Pulldown
    Validate Pulldown Button  ${btn_delivery}  # Delivery Options Pulldown
    Validate Pulldown Button  ${btn_match}  # Match Pulldown
    Validate Pulldown Button  ${btn_views}  # Views Pulldown
    Validate Pulldown Button  ${btn_shop}  # Shop by Category Pulldown

    Close Browser

*** Keywords ***
Validate Pulldown Button
    [Arguments]  ${Button}
    ${passed}=  Run Keyword And Return Status  Click Element  ${Button}
    Run Keyword If  ${passed}  Click Element  ${Button}
    #${passed}=  Run Keyword And Return Status  Wait Until Element Is Enabled  ${Button}
    #Run Keyword If  ${passed}  Click Element    ${Button}
    ${var1}=  Run Keyword If  ${passed}  Log  ${Button}
    ...   ELSE  Log  Button not visible on page  WARN

