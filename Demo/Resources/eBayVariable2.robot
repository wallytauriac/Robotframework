*** Settings ***
Documentation    Suite description

*** Variables ***
# Customer Services
${BROWSER}    chrome
${url}  http://www.ebay.com
${SLEEP}    3
${obj_signin}  xpath=//a[@href="https://signin.ebay.com/ws/eBayISAPI.dll?SignIn&ru=https%3A%2F%2Fwww.ebay.com%2F"]  #Signin page link
${obj_userid}  xpath=//input[@name="userid"]  # email user name on signin page
${obj_continue}  xpath=//button[@name="signin-continue-btn"]  # Signin continue button
${obj_register}  xpath=//a[@href="https://reg.ebay.com/reg/PartialReg?ru=https%3A%2F%2Fwww.ebay.com%2F"]  #Register page link
${obj_fname}  xpath=//input[@name="firstname"]
${obj_lname}  xpath=//input[@name="lastname"]
${obj_email}  xpath=//input[@name="email"]
${obj_psw}  xpath=//input[@name="PASSWORD"]
# Home page
${obj_myebay}  xpath=//a[@title="My eBay"]
${obj_watchlist}  xpath=//a[@title="Watchlist"]
# Search Services
${btn_condition}  xpath=(//span[@class="expand-btn__cell"])[2]  # Condition Pulldown
${btn_delivery}  xpath=(//span[@class="expand-btn__cell"])[3]  # Delivery Options Pulldown
${btn_match}  xpath=(//span[@class="expand-btn__cell"])[4]  # Match Pulldown
${btn_views}  xpath=(//span[@class="expand-btn__cell"])[5]  # Views Pulldown
${btn_shop}  xpath=//i[@id="gh-shop-ei"]  # Shop by Category Pulldown
# Visitor Services
${obj_motors}  xpath=(//a[@href="https://www.ebay.com/b/Auto-Parts-and-Vehicles/6000/bn_1865334"])[2]  # Motors Home Bar Link
${obj_title}  xpath=//span[@class="b-pageheader__text"]  # Page title
${obj_fashion}  xpath=(//a[@href="https://www.ebay.com/b/Fashion/bn_7000259856"])[2]
${obj_electron}  xpath=(//a[@href="https://www.ebay.com/b/Electronics/bn_7000259124"])[2]
${obj_deals}  xpath=(//a[@href="https://www.ebay.com/deals"])[2]
${obj_music}  xpath=(//a[@href="https://www.ebay.com/b/Music/bn_7000710860"])[2]
${obj_bcrumb}  css:body > div.pagecontainer.srp-main--isLarge > div.pagecontainer__top > nav > ol > li:nth-child(1) > a
${obj_title2}  xpath=//*[@id="refit-spf-container"]/div[1]/h1/a  # Deal page title
${obj_title3}  xpath=//*[@id="s0-15-6-0-1[1]-0"]/div[1]/div[2]/h1  # Music page title
