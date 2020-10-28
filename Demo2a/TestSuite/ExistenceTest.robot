*** Settings ***
Library  SeleniumLibrary


*** Test Cases ***
Test Existence of website
    Open Browser  https://google.com  chrome
    Close Browser
