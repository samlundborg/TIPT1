*** Settings ***

Library                 SeleniumLibrary
Resource                    ../Resources/keywords_general.robot
Resource                    ../Resources/keywords_handla.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

*** Test Cases ***

titel
    [Documentation]  Flow of Handla
    [Tags]  TSH-01

    Go to Web Page
    Go to Matsedel
    Click on todays date


