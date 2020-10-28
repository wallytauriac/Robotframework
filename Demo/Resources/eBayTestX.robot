*** Settings ***
Library          SeleniumLibrary
Library          ExcelLibrary
Documentation    Suite description
...              Main test case file for eBay Acceptance Testing

Resource  eBayVariable2.robot

*** Keywords ***
Launch Excel
    [Arguments]  ${sheet}
    Open Excel Document  filename=C:/Users/wally/Documents/Python/Demo/TestSuite/eBay/eBayScenarioX.xlsx  doc_id=docid
    Get Sheet  sheet_name=${sheet}
    ${TC}=  Read Excel Column  col_num=1  row_offset=0  max_num=0  sheet_name=${sheet}
    @{COL_ONAME}=  Read Excel Column  col_num=4  row_offset=0  max_num=0  sheet_name=${sheet}
    #${WND_ONAME}=  Read Excel Cell  row_num=1  col_num=4  sheet_name=REPO
    #Set Global Variable  ${WND_ONAME}

Launch Browser
    [Arguments]  ${brwsr}
    Set Selenium Speed  1 seconds
    Open Browser  ${url}  ${brwsr}
    Maximize Browser Window

Stop Browser
    Close Browser

Stop Suite
    Close All Excel Documents

Customer Services
    [Arguments]  ${WND_ONAME}
    Log  ${WND_ONAME}
    [Documentation]    Customer Services (Signin,Register,MyeBay,Watchlist)
    ${var1}=  Run Keyword If  "${WND_ONAME}"=="Signin"  Check Signin
    ...    ELSE IF  "${WND_ONAME}"=="Register"  Check Register
    ...    ELSE IF  "${WND_ONAME}"=="MyeBay"  Check MyeBay
    ...    ELSE IF  "${WND_ONAME}"=="Watchlist"  Check Watchlist

Check Signin
    Log Title
    ${passed}=  Run Keyword And Return Status  Set Focus To Element  ${obj_signin}
    Run Keyword If  ${passed}  Click Link   ${obj_signin}
    Log Title
    # CAPTCHA VERIFY PROCESS INTERMITENT REQUEST
    Wait Until Element Is Visible  ${obj_userid}  timeout=20
    Input Text    ${obj_userid}    abc@xyz.com
    Click Element    ${obj_continue}  # Signin continue button
    Go back

Check Register
    Log Title
    Click Link    ${obj_register}
    Log Title
    # CAPTCHA VERIFY PROCESS INTERMITENT REQUEST
    Wait Until Element Is Visible  ${obj_fname}  timeout=20
    Input Text    ${obj_fname}    MyName
    Input Text    ${obj_lname}    LName
    Input Text    ${obj_email}    abc@xyz.com
    Input Text    ${obj_psw}    8^=A&3etbZ7Chm6
    Go Back

Check MyeBay
    Log Title
    Click Link    ${obj_myebay}
    Log Title
    # An attempt to click this link twice attempts signin
    # This leads to captch verify
    Go Back

Check Watchlist
    Log Title
    Click Link    ${obj_watchlist}
    Click Link    ${obj_watchlist}
    Log Title

Search Services
    [Arguments]  ${WND_ONAME}
    Log  ${WND_ONAME}
    [Documentation]    Search Services (Product find & Pulldown checks)
    Input Text    //input[@name="_nkw"]    ${WND_ONAME}
    Click Element    //input[@id="gh-btn"]
    # Results for Mobile search
    Validate Pulldown Button  ${btn_condition}  # Condition Pulldown
    Validate Pulldown Button  ${btn_delivery}  # Delivery Options Pulldown
    Validate Pulldown Button  ${btn_match}  # Match Pulldown
    Validate Pulldown Button  ${btn_views}  # Views Pulldown
    Validate Pulldown Button  ${btn_shop}  # Shop by Category Pulldown
    Go Back

Validate Pulldown Button
    [Arguments]  ${Button}
    Log Title
    Log  ${Button}
    ${passed}=  Run Keyword And Return Status  Click Element  ${Button}
    Run Keyword If  ${passed}  Click Element  ${Button}
    #${passed}=  Run Keyword And Return Status  Wait Until Element Is Enabled  ${Button}
    #Run Keyword If  ${passed}  Click Element    ${Button}
    ${var1}=  Run Keyword If  ${passed}  Log  ${Button}
    ...   ELSE  Log  Button not visible on page  WARN

Visitor Services
    [Arguments]  ${WND_ONAME}
    Log  ${WND_ONAME}
    [Documentation]    Visitor Services (Motors,Fashion,Electron,Deals,Music)
    ${var1}=  Run Keyword If  "${WND_ONAME}"=="Motors"  Check Motors
    ...    ELSE IF  "${WND_ONAME}"=="Fashion"  Check Fashion
    ...    ELSE IF  "${WND_ONAME}"=="Electronics"  Check Electron
    ...    ELSE IF  "${WND_ONAME}"=="Deals"  Check Deals
    ...    ELSE IF  "${WND_ONAME}"=="Music"  Check Music

Check Motors
    Log Title
    Click Link    ${obj_motors}
    Log Title
    Element Should Contain  ${obj_title}  eBay Motors
    ${passed}=  Run Keyword And Return Status  Set Focus To Element  ${obj_bcrumb}
    Run Keyword If  ${passed}  Log  Breadcrumb List is present  level=INFO
    ...      ELSE  Log  Breadcrumb List missing  level=WARN
    Go Back

Check Fashion
    Log Title
    Click Link    ${obj_fashion}
    Log Title
    Element Should Contain    ${obj_title}  Fashion
    ${passed}=  Run Keyword And Return Status  Set Focus To Element  ${obj_bcrumb}
    Run Keyword If  ${passed}  Log  Breadcrumb List is present  level=INFO
    ...      ELSE  Log  Breadcrumb List missing  level=WARN
    Go Back

Check Electron
    Log Title
    Click Link    ${obj_electron}
    Log Title
    Element Should Contain  ${obj_title}  Electronics
    ${passed}=  Run Keyword And Return Status  Set Focus To Element  ${obj_bcrumb}
    Run Keyword If  ${passed}  Log  Breadcrumb List is present  level=INFO
    ...      ELSE  Log  Breadcrumb List missing  level=WARN
    Go Back

Check Deals
    Log Title
    Click Link    ${obj_deals}
    Log Title
    Element Should Contain  ${obj_title2}  Deals
    ${passed}=  Run Keyword And Return Status  Set Focus To Element  ${obj_bcrumb}
    Run Keyword If  ${passed}  Log  Breadcrumb List is present  level=INFO
    ...      ELSE  Log  Breadcrumb List missing  level=WARN
    Go Back

Check Music
    Log Title
    Click Link  ${obj_music}
    Log Title
    Element Should Contain  ${obj_title3}  Music
    ${passed}=  Run Keyword And Return Status  Set Focus To Element  ${obj_bcrumb}
    Run Keyword If  ${passed}  Log  Breadcrumb List is present  level=INFO
    ...      ELSE  Log  Breadcrumb List missing  level=WARN
    Go Back