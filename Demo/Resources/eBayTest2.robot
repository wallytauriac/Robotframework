*** Settings ***
Library   SeleniumLibrary

Documentation    Suite description

Resource  eBayVariable2.robot

*** Keywords ***
Customer Services

    Click Link    ${obj_signin}
    # CAPTCHA VERIFY PROCESS INTERMITENT REQUEST
    Wait Until Element Is Visible  ${obj_userid}  timeout=20
    Input Text    ${obj_userid}    abc@xyz.com
    Click Element    ${obj_continue}  # Signin continue button
    Go back
    Click Link    ${obj_register}
    # CAPTCHA VERIFY PROCESS INTERMITENT REQUEST
    Wait Until Element Is Visible  ${obj_fname}  timeout=20
    Input Text    ${obj_fname}    MyName
    Input Text    ${obj_lname}    LName
    Input Text    ${obj_email}    abc@xyz.com
    Input Text    ${obj_psw}    8^=A&3etbZ7Chm6
    Go Back
    Click Link    ${obj_myebay}
    # An attempt to click this link twice attempts signin
    # This leads to captch verify
    Go Back
    Click Link    ${obj_watchlist}
    Click Link    ${obj_watchlist}

Search Services

    Input Text    //input[@name="_nkw"]    mobile
    Click Element    //input[@id="gh-btn"]
    # Results for Mobile search
    Validate Pulldown Button  ${btn_condition}  # Condition Pulldown
    Validate Pulldown Button  ${btn_delivery}  # Delivery Options Pulldown
    Validate Pulldown Button  ${btn_match}  # Match Pulldown
    Validate Pulldown Button  ${btn_views}  # Views Pulldown
    Validate Pulldown Button  ${btn_shop}  # Shop by Category Pulldown

Validate Pulldown Button
    [Arguments]  ${Button}
    ${passed}=  Run Keyword And Return Status  Click Element  ${Button}
    Run Keyword If  ${passed}  Click Element  ${Button}
    #${passed}=  Run Keyword And Return Status  Wait Until Element Is Enabled  ${Button}
    #Run Keyword If  ${passed}  Click Element    ${Button}
    ${var1}=  Run Keyword If  ${passed}  Log  ${Button}
    ...   ELSE  Log  Button not visible on page  WARN

Visitor Services

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

Launch Browser
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

Launch Suite
    Set Selenium Speed  1 seconds

Stop Browser
    Close Browser