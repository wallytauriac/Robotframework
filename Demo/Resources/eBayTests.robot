*** Settings ***
Library  SeleniumLibrary
Resource  eBayVariables.robot
*** Variables ***
${search_var1}  ${search_text}[0]
${search_var2}  ${search_text}[1]
${search_var3}  ${search_text}[2]
*** Keywords ***

Test Search
    [Arguments]  ${search_var}=mobile
    Input Text  ${search_input}  ${search_var}
    Press Keys  xpath://*[@id="gh-btn"]  [Return]
    Page Should Contain  results for ${search_var}

Filter Results
    #Click Element  xpath://*[@id="s0-13-11-5-1[0]-75[1]-14-button-1-7"]  #pulldown menu
    #Click Element  xpath://*[@id="s0-13-11-5-1[0]-75[1]-14-content-menu"]/a[2]
    # Pulldown menu test
    Click Element  xpath://*[@id="nid-wJl-4"]/button[1]/span[1]  #Filter pulldown menu 1 - Condition
    Click Element  xpath://*[@id="nid-wJl-3"]/button[1]/span[1]  #Filter pulldown menu 2 - Delivery Option
    Click Element  xpath://*[@id="nid-wJl-2"]/button[1]/span[1]/span[1]  #Filter pulldown menu 3 - Match
    Click Element  xpath://*[@id="nid-wJl-1"]/button[1]/span[1]/span[1]  #Filter pulldown menu 4 - View
    Click Element  xpath://*[@id="gh-shop-ei"]  #Shop by Category
    Sleep  3s

Verify Filter
        Page Should Contain Element  //*[@id="s0-13-11-6-3-query_answer1-answer-2-1-0-list"]/li[1]/div/a