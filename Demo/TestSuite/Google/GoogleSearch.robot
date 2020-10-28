*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://www.google.com
${browser}  chrome
*** Test Cases ***
This is a sample test of Google
    [documentation]  Google test
    [tags]  Regression

    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    Input Text  name:q  RCV Academy
    #Click Element  name:q
    #Press Keys  xpath://*[@id="tsf"]//div[2]/ul/li  [RETURN]  bad addr
    #Click Element  xpath://*[@id="tsf"]/div[2]/div[1]/div[1]/div/div[3]/div[2]
    Click Element  xpath://*[@id="tsf"]/div[2]/div[1]/div[2]/div[2]/div[2]/center/input[1]
    Sleep  3s
    @{results_on_page}=  Get WebElements  xpath://*[@id="rso"]/div
    #@{results_on_page}=  Get WebElements  xpath://*[@id="rso"]/div[1]/div/div/div[2]/div/span/text()

    FOR  ${element}  IN  @{results_on_page}
        ${text}=  Get Text  ${element}
    END

    Close Browser


