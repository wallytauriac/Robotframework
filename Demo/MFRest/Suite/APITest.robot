*** Settings ***
Documentation   Zoomba API Library Tests
Library         Zoomba.APILibrary
#Variables       APITestData.py
#Test Setup      Suppress Insecure Request Warnings

*** Variables ***
&{headers}=       Content-Type=application/json      charset=UTF-8

${endpoint_1}=      https://jsonplaceholder.typicode.com
${endpoint_2}=    https://reqres.in/api

*** Test Cases ***
Call Get Request Basic Test

    #${resp}=   Call Get Request     ${headers}     ${endpoint}     /todos/1
    #Validate Response Contains Expected Response     ${resp.text}    ${get_basic_expected}