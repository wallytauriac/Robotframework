*** Settings ***
Library  SeleniumLibrary
Library  ExcelLibrary
Library  DataDriver    .xlsx
Library  Collections
Library  ../TestSuite/MyFunctions.py
#Library  Webtours_RegrCommon.robot


*** Variables ***
${Login_status}  N
${FF3_rtrn8am}  css:body > blockquote > form > center > table:nth-child(5) > tbody > tr:nth-child(2) > td:nth-child(3)


*** Keywords ***

Verify Flight Prices
    [Arguments]  ${depart}  ${arrive}  ${class}  ${depdate}  ${rtndate}  ${time}  ${rtrip}
    #${FF3_amcost}  Set Variable  ${0}

    Set Global Variable  ${FF3_rtrn8am}
    Get Flight Data
    Select Right Panel Frame
    Select From List By Value    ${FF2_depart}    ${depart}
    Select From List By Value    ${FF2_arrival}   ${arrive}
    ${var1}=  Run Keyword If  "${rtrip}"=="Y"  Click Element  ${FF2_rndtrip}
    ...    ELSE  Log  One way Flight Plan
    ${depart_base}=  Set Variable  ${000}
    ${arrive_base}=  Get Arrive Base Value  ${depart}  ${arrive}
    Log Many  Base Cost = $  ${arrive_base}
    Log Many  Departure Date is  "${depdate}"
    ${resv_days}=  Calculate Days  ${depdate}
    Log Many  Advance Reservation Days =   ${resv_days}
    ${adj_price}=  Calculate Class Increase  ${class}  ${arrive_base}
    Log Many  Class Increased price = $  ${adj_price}
    ${r_discount}=  Calculate Reservation Discount  ${resv_days}  ${adj_price}
    Log Many  Reservation Discount = $  ${r_discount}
    ${t_discount}=  Calculate TOD Discounts  ${time}  ${adj_price}
    Log Many  Time of Day Discount = $  ${t_discount}

    Select Flight Class  ${class}
    Select Flight Dates  ${depdate}  ${rtndate}

    Click Element    ${FF2_continue}
    Unselect Frame
    Select Right Panel Frame

    Log  ${FF3_amcost}
    #Select Flight Time  ${time}  ${FF3_amcost}  ${rtrip}  ${adj_price}  ${r_discount}  ${t_discount}
    Wait Until Element Is Visible    ${FF3_outbound}   10s
    ${passed}=	Run Keyword And Return Status  Page Should Contain Element  ${FF3_rtrn8am}
    ${amcost}=  Run Keyword If  ${passed}  Get Roundtrip Cost  ${amcost}


    Log Many  AMCOST =  ${amcost}
    Log Many  RTRIP =  ${rtrip}
    ${arrive_cost}=  Calculate Flight Cost  ${adj_price}  ${r_discount}  ${t_discount}  ${amcost}  ${rtrip}
    Set Global Variable  ${arrive_cost}
    Log Many  Arrival Cost = $  ${arrive_cost}
    ${var2}=  Run Keyword If  "${time}"=="8am"  Click Element  ${FF3_outbound}
    ...    ELSE IF  "${time}"=="1pm"  Click Element  ${FF3_outbound2}
    ...    ELSE IF  "${time}"=="5pm"  Click Element  ${FF3_outbound3}
    ...    ELSE IF  "${time}"=="11pm"  Click Element  ${FF3_outbound4}
    ...    ELSE  Click Element  ${FF3_outbound}

    Click Element    ${FF3_continue}
    Unselect Frame 
    Select Right Panel Frame
    Click Element    ${PD_continue}
    Unselect Frame
    Select Right Panel Frame
    ${total_cost}=  Get Text  css:body > blockquote > center > table:nth-child(5) > tbody > tr:nth-child(3) > td:nth-child(3) > b
    # Comparison might require variable conversions
    ${var2}=  Run Keyword If  "${total_cost}"=="${arrive_cost}"  Log  Calculated Flight Cost matches invoice
    ...    ELSE  Log  ${total_cost}
    Capture Page Screenshot
    Unselect Frame
    Select Left Panel Frame
    Click Link    ${HP_signoff}
    Unselect Frame




Get Flight Data
    Sign In Web Tours
    Select Left Panel Frame
    Wait Until Element Is Visible  ${HP_flight}  10s
    Click Link  ${HP_flight}
    Unselect Frame
    Select Right Panel Frame
    ${departures}=	 Get List Items	 ${FF2_depart}
    ${arrivals}=	Get List Items	 ${FF2_arrival}
    Unselect Frame

Select Flight Class
    [Arguments]  ${class}
    ${var2}=  Run Keyword If  ${class}==0  Click Element  ${FF2_frstclass}
    ...    ELSE IF  ${class}==1  Click Element  ${FF2_busclass}
    ...    ELSE IF  ${class}==2  Click Element  ${FF2_coachclass}
    ...    ELSE  Click Element  ${FF2_frstclass}

Select Flight Dates
    [Arguments]  ${depdate}  ${rtndate}
    Log Many  Orig Departure Date   ${depdate}
    Log Many  Orig Return Date  ${rtndate}
    ${ddate}=  Reformat Date   ${depdate}
    ${rdate}=  Reformat Date   ${rtndate}
    Input Text  ${FF2_departdate}  ${ddate}
    Input Text  ${FF2_returndate}  ${rdate}


Get Roundtrip Cost
    [Arguments]  ${amcost}
    Log  ${FF3_amcost}
    ${FF3_amcost}=  Get Text  ${FF3_rtrn8am}
    ${amcost}=  Set Variable  ${FF3_amcost}
    Set Global Variable  ${amcost}
    [Return]  ${amcost}
