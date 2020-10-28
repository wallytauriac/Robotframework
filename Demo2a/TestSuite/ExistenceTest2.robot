*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://google.com
${browser}  chrome

*** Test Cases ***
Test Existence of website
    Open Browser  ${url}  ${browser}
    Close Browser