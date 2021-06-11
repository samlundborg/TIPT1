*** Settings ***

Library                     SeleniumLibrary
Library                     DateTime
Library                     DateTime.py
Library                     dateConverter.py
*** Variables ***

*** Keywords ***

Today by name
    ${CurrentDayNum}        Today By Number
    ${CurrentDayName}       day number to swedish      ${CurrentDayNum}
    Should be Equal         Fredag                    ${CurrentDayName}

Go to Matsedel
   Maximize Browser Window
   Sleep    1
   Click element       xpath://html/body/div/div/div/div/div[1]/a[3]
   sleep    1
   wait until page contains     Veckomatsedel
   page should contain          Veckomatsedel

Click on todays date
   ${CurrentDay}        Today By Number
   Click element    xpath://*[@id="planner-view-container"]/div/div[${CurrentDay}]/div[2]/div[1]/div[2]/h4
   sleep    0.5
   Wait until page contains     Välj recept
   wait until page contains element     xpath://*[@id="choose-buttons"]/div[2]/h3

Click on Valj recept at mig
    sleep   0.5
    Click element   xpath://html/body/div/div/div/div[2]/div/div/span/div/div/div[2]/h3
    Wait until page contains element    xpath://*[@id="random-button"]
    Page should contain element         xpath://*[@id="large-footer"]/img

Click on Spara
    Click element   xpath://*[@id="large-footer"]/img
    Wait until location does not contain    xpath://*[@id="large-footer"]/img
    Page should not contain button      xpath://*[@id="large-footer"]/img

Click on Handla
    Click element   xpath://*[@id="full-container"]/navigation-footer/div/div
    Page should contain element      xpath://*[@id="full-container"]/navigation-footer/div/div

Mark recipe
    sleep   0.5
    Click element   xpath://*[@id="shop-for-days-container"]/ul/li/div/div[2]/img
    ##TODO Need to assert
Click on Skicka Lista
    sleep   0.5
    Click element   xpath://*[@id="shoppinglist-table"]/div/a
    ##TODO Need to assert