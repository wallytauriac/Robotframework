*** Settings ***
Documentation     A test suite with a single test for Select a Flight: Mercury Tours
...               Created by hats' Robotcorder
Library           Selenium2Library    timeout=10

Suite Setup    Open Browser    http://newtours.demoaut.com/mercurywelcome.php    ${BROWSER}
*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
Login Test
    Mercury Tours Login

Select a Flight: Mercury Tours test 3
    #Open Browser    http://newtours.demoaut.com/mercuryreservation2.php    ${BROWSER}
    Log Title
    #Left panel links
    #Click Link    //a[@href="mercurywelcome.php"]
    #Click Link    //a[@href="mercuryreservation.php"]
    #Click Link    //a[@href="mercuryunderconst.php"]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[2]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[3]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[4]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[5]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[6]
    #Top panel links
    #Click Link    //a[@href="mercurysignoff.php"]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[7]
    #Click Link    //a[@href="mercuryregister.php"]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[8]
    #Click Link    xpath=(//a[@href="mercuryunderconst.php"])[9]
    #Reservation page 3
    #Click Link    //a[@href="/cgi/get?airplane:_x32HKTgUlm*itn/airplanes/M80,itn/pl/thetrip"]
    Input Text    //input[@name="passFirst0"]   Jim
    Input Text    //input[@name="passLast0"]    Bean
    Select From List By Index    //select[@name="pass.0.meal"]  0
    Select From List By Value    //select[@name="creditCard"]    AX
    Input Text    //input[@name="creditnumber"]  123456678
    Select From List By Index    //select[@name="cc_exp_dt_mn"]    0
    Select From List By Index    //select[@name="cc_exp_dt_yr"]    0
    Input Text    //input[@name="cc_frst_name"]  Jim
    Input Text    //input[@name="cc_mid_name"]  J
    Input Text    //input[@name="cc_last_name"]  Bean
    Click Element    //input[@name="ticketLess"]
    Input Text    //input[@name="billAddress1"]    1325 Borregas Ave.
    Input Text    //input[@name="billAddress2"]    apt 2
    Input Text    //input[@name="billCity"]    Sunnyvale
    Input Text    //input[@name="billState"]    CA
    Input Text    //input[@name="billZip"]    94089
    Select From List By Value    //select[@name="billCountry"]    215
    Click Element    xpath=(//input[@name="ticketLess"])[2]
    Input Text    //input[@name="delAddress1"]    1325 Borregas Ave.
    Input Text    //input[@name="delAddress2"]    apt 2
    Input Text    //input[@name="delCity"]    Sunnyvale
    Input Text    //input[@name="delState"]    CA
    Input Text    //input[@name="delZip"]    94089
    Select From List By Value    //select[@name="delCountry"]    215
    Click Element    //input[@name="buyFlights"]  #Secure Purchase
    Wait Until Page Contains Element  //a[contains(text(),'SIGN-OFF')]
    Click Element    //a[contains(text(),'SIGN-OFF')]
    Close Browser

*** Keywords ***
Mercury Tours Login

    Input Text    //input[@name="userName"]    demo
    Input Password    //input[@name="password"]    demo
    Click Element    //input[@name="login"]
    Click Element    //input[@name="tripType"]
    Click Element    Name:findFlights  #Continue to page 2
    Click Element    Name:reserveFlights  #Continue to page 2a