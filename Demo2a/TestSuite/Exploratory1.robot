*** Settings ***
Library    MyLibrary1.py
Documentation  Script used to test the use of Python functions in Robot Framework



*** Test Cases ***
My Test
    Do Nothing
    Hello    Wally World
    ${random_nbr}=  Get Random Value  100
    Log  ${random_nbr}
    ${resp}=  Validate Phone Number  (281)355-5419
    Run Keyword If  '${resp}' == 'False'   Log  Invalid Phone Number  level=ERROR
    ${resp}=  Validate Credit Card  37562198673
    Run Keyword If  '${resp}' == 'False'   Log  Invalid Credit Card  level=ERROR

    ${resp}=  Validate Number Length  37562198673  12
    Run Keyword If  '${resp}' == 'False'   Log  Invalid Value Length  level=ERROR

    ${resp}=  Validate Email  wallyt@gmail.com
    Run Keyword If  '${resp}' == 'False'   Log  Invalid Email Address  level=WARN

