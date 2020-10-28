*** Settings ***
Library    ../TestSuite/MyLibrary1.py
Library    SeleniumLibrary
Documentation  Resource file used to test the use of Python functions in Robot Framework


*** Keywords ***
Generate Random Value
    ${random_nbr}=  Get Random Value  100
    Log  ${random_nbr}

Verify Phone Number
    ${resp}=  Validate Phone Number  (281)355-5419
    Run Keyword If  '${resp}' == 'False'   Log  Invalid Phone Number  level=WARN

Verify Credit Card Number
    ${resp}=  Validate Credit Card  37562198673
    Run Keyword If  '${resp}' == 'False'   Log  Invalid Credit Card  level=WARN

Verify Number Length
    ${resp}=  Validate Number Length  37562198673  12
    Run Keyword If  '${resp}' == 'False'   Log  Invalid Value Length  level=WARN

Verify Email Address
    ${resp}=  Validate Email  wallyt@gmail.com
    Run Keyword If  '${resp}' == 'False'   Log  Invalid Email Address  level=WARN
