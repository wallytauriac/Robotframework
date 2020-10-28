*** Settings ***
Library    MyLibrary2.py
Documentation  Script used to test the use of Python functions in Robot Framework



*** Test Cases ***
My Test
    Do Nothing
    Hello    world
    ${fdate}=  Get YYYYMMDD
    ${w}=  Get Day Of Week
    ${t}=  Get Time Of Day
    ${fd}=  Format Date  06052020
    ${newdate}=  Get Future Date  7
    ${olddate}=  Get Previous Date  7
