*** Settings ***
Documentation     A test suite with a single test for Women - My Store
...               www.automationpractice.com website
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10


*** Variables ***
@{Description}      Header Objects
${obj_search}       //input[@name="search_query"]
${obj_srchbtn}      //button[@name="submit_search"]
${obj_return}       //i[@class="icon-home"]
${obj_return2}      //a[@title="Return to Home"]
${obj_Womenbtn}     //*[@id="block_top_menu"]/div
${obj_pglink1}      //a[@title="Women"]
${obj_pglink2}      //a[@title="Dresses"]
${obj_pglink2a}     //a[@href="http://automationpractice.com/index.php?id_category=8&amp;controller=category"]
${obj_pglink3}      //a[@title="T-shirts"]
${obj_pglink3a}      //a[@href="http://automationpractice.com/index.php?id_category=5&amp;controller=category"]
${obj_cartlnk}      //a[@title="View my shopping cart"]
${obj_contact}      //a[@title="Contact Us"]
${obj_Loginbtn}     //a[@title="Log in to your customer account"]

${URL}  http://automationpractice.com/index.php?id_category=3&controller=category
${BROWSER}  firefox
${lnk_dresses}      http://automationpractice.com/index.php?id_category=8&controller=category
${lnk_tshirts}      http://automationpractice.com/index.php?id_category=5&controller=category
*** Keywords ***
Launch Browser
    Open Browser     ${URL}   ${BROWSER}
    Maximize Browser Window

Test Search
    Click Element    xpath=(//div)[11]
    Input Text       ${obj_search}    dress
    Click Element    ${obj_srchbtn}
    Click Element    ${obj_return}    #Return to Home Page

Test Header Link Women

    Click Element    xpath=(//div)[11]
    Click Link          ${obj_pglink1}
    Click Element       ${obj_return}    #Return to Home Page

Test Header Link Dresses
    Click Element    xpath=(//div)[11]
    Wait Until Element is Enabled  ${obj_pglink2}  15s
    #Set Focus to Element  ${obj_search}
    #Click Link       ${obj_pglink2}
    Go To  ${lnk_dresses}
    Wait Until Element is Enabled  ${obj_return}  15s
    Sleep  2s
    Click Element       ${obj_return}    #Return to Home Page

Test Header Link T-Shirts
    Click Element    xpath=(//div)[11]
    Wait Until Element is Enabled  ${obj_pglink3}  15s
    #Set Focus to Element  ${obj_search}
    #Click Link          ${obj_pglink3}
    Go To  ${lnk_tshirts}
    Wait Until Element is Enabled  ${obj_return}  15s
    Click Element       ${obj_return}    #Return to Home Page
    Click Link          ${obj_cartlnk}
    Click Element       ${obj_return2}
    Click Link          ${obj_contact}
    Click Link          ${obj_Loginbtn}
    Click Element       ${obj_return}

Check Page Objects
    Page Should Contain Element  ${obj_Womenbtn}
    Page Should Contain Link  ${obj_pglink1}
    Page Should Contain Link  ${obj_pglink2}
    Page Should Contain Link  ${obj_pglink3}
    Page Should Contain Link  ${obj_cartlnk}
    Page Should Contain Link  ${obj_contact}
    Page Should Contain Link  ${obj_Loginbtn}
