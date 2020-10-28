*** Settings ***
Documentation     A test suite with a single test for My Store
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
My Store test
    Open Browser    http://automationpractice.com/index.php    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  1
    Scroll Element into View  xpath=(//a[@title="Faded Short Sleeve T-shirts"])
    #Scroll Element into View  //*[@id="center_column"]/ul[1]/li[1]/div[1]/div[1]/div[1]/a[1]/img[1]
    Mouse Over  xpath=(//a[@title="Faded Short Sleeve T-shirts"])
    ${excludes}=  Get Window Handles
    Wait Until Element Is Enabled  xpath=(//span)[30]  10s
    Click Element    xpath=(//span)[30]
    Alert Should Not Be Present
    Wait Until Element Is Enabled  //span[@id="layer_cart_product_price"]  10s
    ${tval1}=  Get Text  xpath=//span[@id="layer_cart_product_price"]
    #Click Element    //span[@id="layer_cart_product_price"]
    Wait Until Element Is Enabled  //span[@class="ajax_block_cart_total"]  10s
    ${tval2}=  Get Text  xpath=//span[@class="ajax_block_cart_total"]
    ${excludes2}=  Get Window Handles
    Click Element  xpath=(//span[@title="Close window"])
    #Click Element    //span[@class="ajax_block_cart_total"]
    #Wait Until Element Is Enabled  xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/span/span/text()  10s
    #Click Element    xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/span/span/text()
    #Wait Until Element Is Enabled  xpath=(//span)[29]  10s
    #Click Element    xpath=(//span)[29]

    Wait Until Element Is Enabled  xpath=(//a[@title="Blouse"])  10s
    Mouse Over  xpath=(//a[@title="Blouse"])
    Wait Until Element Is Enabled  xpath=(//span)[41]  10s
    Click Element    xpath=(//span)[41]
    Alert Should Not Be Present
    Wait Until Element Is Enabled  //span[@class="ajax_block_cart_total"]  10s
    ${tval3}=  Get Text  //span[@class="ajax_block_cart_total"]
    ${excludes3}=  Get Window Handles
    #Click Element  xpath=(//span[@title="Close window"])

    #Click Element    //span[@class="ajax_block_cart_total"]
    Click Element    xpath=(//div[@class="layer_cart_row"])[3]
    ${tval4}=  Get Text  //span[@class="ajax_block_cart_total"]
    #Click Element    //span[@class="ajax_block_cart_total"]
    Scroll Element into View     xpath=(//a[@title="View my shopping cart"])
    Mouse Over  xpath=(//a[@title="View my shopping cart"])
    ${tval5}=  Get Text  //span[@class="ajax_cart_quantity unvisible"]
    ${tval6}=  Get Text  //span[@class="ajax_cart_total unvisible"]
    #${tval7}=  Get Text  //span[@id="total_price"]
    Wait Until Element Is Enabled  xpath=(//a[@title="View my shopping cart"])  10s
    #Click Link  xpath=(//a[@title="View my shopping cart"])
    Click Element  //*[@id="header"]/div[3]
    Mouse Over  xpath=(//a[@title="View my shopping cart"])
    Click Element  //*[@id="header"]/div[3]/div[1]/div[1]/div[3]/div[1]/a[1]/b[1]

    Wait Until Element Is Enabled  //span[@id="total_price"]
    Scroll Element into View   //span[@id="total_price"]
    ${tval7}=  Get Text  //span[@id="total_price"]
    Capture Page Screenshot

    Close Browser

*** Keywords ***
Extra Keywords
    Scroll Element into View      xpath=(//span)[33]
    Mouse Over  xpath=(//span)[33]
    Click Element    xpath=(//span)[33]
    Click Element    xpath=(//span)[46]
    Click Element    xpath=(//span)[45]
    Click Element    //span[@class="ajax_cart_product_txt_s  unvisible"]
    Click Element    //span[@class="ajax_cart_quantity"]
    Click Element    xpath=(//span)[33]
    Click Element    //b
    Click Element    //span[@id="total_price"]
    Click Element    //span[@id="total_price"]
    Click Element    xpath=(//span)[58]
    Wait Until Element Is Enabled  //i[@class="icon-home"]  10s
    Click Element    //i[@class="icon-home"]

