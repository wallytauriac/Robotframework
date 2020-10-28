*** Settings ***
#Library  Zoomba.APILibrary
Library  SeleniumLibrary            #Selenium Command Support
Library  XML
Library   RequestsLibrary


#Robot -d MFRest/Results MFRest/Suite/REST_Test_1.robot

*** Variables ***
&{headers1}=       Content-Type=application/json      charset=UTF-8
&{headers2}=       Content-Type=application/xml      charset=UTF-8
${API1}=          http://localhost:8000/Flights_REST
${API2}=          http://restapi.demoqa.com
${endpoint1}=      /Flights/20279
${endpoint2}=     /utilities/weather/city/Delhi
${fullstring}=    https://jsonplaceholder.typicode.com

*** Test Cases ***
Rest Flight Number Test
    Open Browser  about:blank  chrome
    Create Session    mysession   ${API1}
    ${resp}=  Get Request  mysession   ${endpoint1}
    Log Many  Status Code =  ${resp.status_code}
    Log Many  Content =  ${resp.content}
    Log Many  Header =  ${resp.headers}
    ${root}=  Parse XML  ${resp.content}
    ${airline}=  Get Element Text  ${root}  Airline
    ${arrcity}=  Get Element Text  ${root}  ArrivalCity
    Close Browser

*** Keywords ***
