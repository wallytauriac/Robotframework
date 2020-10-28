*** Settings ***
Library    ../TestSuite/MyLibrary1.py
Library    SeleniumLibrary
Documentation  Script used to test the use of Python functions in Robot Framework
Resource   ../Resource/Verification.robot


*** Test Cases ***
My Test
    Do Nothing
    Hello    Wally World
    Generate Random Value
    Verify Phone Number
    Verify Credit Card Number
    Verify Number Length
    Verify Email Address
