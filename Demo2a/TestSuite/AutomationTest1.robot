*** Settings ***
Documentation     A test suite with a single test for Women - My Store
...               www.automationpractice.com website
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10
Resource          ../Resource/ATResource1.robot

Test Setup        Launch Browser
Test Teardown     Close Browser

*** Variables ***

${SLEEP}    3
${URL}  http://automationpractice.com/index.php?id_category=3&controller=category

*** Test Cases ***
Automation Practice Exploratory Test
    Check Page Objects

Automation Practice Search Test
    Test Search

Automation Practice Header Test 1
    Test Header Link Women

Automation Practice Header Test 2
    Test Header Link Dresses

Automation Practice Header Test 3
    Test Header Link T-Shirts


