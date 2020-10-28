*** Settings ***
Documentation     A test suite with a single test for Women - My Store
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3
${obj_women}  xpath://*[@id="block_top_menu"]/ul[1]/li[1]/a[1]  # Women
${obj_dresses}  //a[@title="Dresses"]   # Dresses
${obj_dresses2}  css:div#block_top_menu > ul > li:nth-of-type(2) > a
${obj_dresses3}  Link:Dresses
${obj_tshirts}  //a[@title="T-shirts"]   # T-Shirts
${obj_tshirts2}  css:div#block_top_menu > ul > li:nth-of-type(3) > a
${obj_tshirts3}  Link:T-shirts

*** Test Cases ***
Women - My Store test
    Open Browser    http://automationpractice.com/index.php?id_category=3&controller=category    ${BROWSER}
    Maximize Browser Window
    Click Element    //i[@class="icon-home"]
    Click Link    //a[@title="Women"]
    #Set Focus To Element  //a[@title="Dresses"]
    Wait Until Element Is Enabled  ${obj_dresses3}
    Set Focus To Element  ${obj_dresses3}
    Click Link    ${obj_dresses3}
    #Set Focus To Element  //a[@title="T-shirts"]
    Wait Until Element Is Enabled  ${obj_tshirts2}  timeout=20
    Set Focus To Element  ${obj_tshirts2}
    Click Link    ${obj_tshirts2}
    Click Element    //b
    Click Link    //a[@title="Contact Us"]
    Click Link    //a[@title="Log in to your customer account"]

    Close Browser