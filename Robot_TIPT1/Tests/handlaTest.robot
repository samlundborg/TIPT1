

*** Settings ***

Library                 SeleniumLibrary
Resource                ../Resources/keywords_general.robot
Resource                ../Resources/keywords_handla.robot
Library                 ../Resources/DateTime.py
Library                 ../Resources/dateConverter.py
Library                     DateTime
Test Setup          Begin Web Test
Test Teardown       End Web Test

*** Test Cases ***

Day converter
    ${day}         Today By Number
    ${compare}     Convert to Integer           4
    Should be Equal           ${compare}        ${day}

Test day converter
    Today by name

Handla Test
    [Documentation]  Flow of Handla
    [Tags]  TSH-01



    Go to Web Page
    Go to Matsedel
    Click on todays date
    Click on Valj recept at mig
    Click on Spara
    Click on Handla
    Mark recipe
    Click on Handla
    Click on Skicka Lista