*** Settings ***
Documentation    Suite description

Resource  ../Resource/ExploratoryTest_Yahoo.robot

Test Setup  Start Test
Test Teardown  Close Browser

#robot -d Result4 TestSuite/ExploratoryTest4_Yahoo.robot
#robot -d Result4 --variable browser:firefox TestSuite/ExploratoryTest4_Yahoo.robot
#robot -d R4_TYPO --include TYPO TestSuite/ExploratoryTest4_Yahoo.robot
#robot -d R4_TYHL --include TYHL TestSuite/ExploratoryTest4_Yahoo.robot
#robot -d R4_TYNL --include TYNL TestSuite/ExploratoryTest4_Yahoo.robot
#robot -d R4_TYSL --include TYSL TestSuite/ExploratoryTest4_Yahoo.robot

*** Test Cases ***
Test YAHOO Page Objects
    [Tags]  TYPO
    Examine objects

Test YAHOO Header Links
    [Tags]  TYHL
    Test Header Links

Test YAHOO News Links
    [Tags]  TYNL
    Test News Links

Test YAHOO Story Links
    [Tags]  TYSL
    Test Story Links
