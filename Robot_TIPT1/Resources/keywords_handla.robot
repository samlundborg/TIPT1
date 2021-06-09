*** Settings ***

Library                     SeleniumLibrary
Library                     DateTime
*** Variables ***

##${CurrentDay}    Get Current Date    result_format=%d
##Log    ${CurrentDay}

*** Keywords ***


Go to Matsedel
   Click element       id=planner-btn           RETURN
   sleep    0.5
   wait until page contains     Veckomatsedel
   page should contain          Veckomatsedel

Click on todays date
   ${CurrentDay}        Get Current Date        result_format=%u
   Click element    xpath://*[@id="planner-view-container"]/div/div[${CurrentDay}]/div[2]/div[1]/div[2]/h4
   sleep    0.5
   Wait until page contains     Välj recept
   wait until page contains element     xpath://*[@id="choose-buttons"]/div[2]/h3
   ##TODO Fixa CurrentDay.. antingen -1 eller python switch/Case / if-sats
   ##TODO page should contain  blabla

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
    Page should contain     Handla för antal dagar

Mark recipe
    sleep   1
    Click element   xpath://*[@id="shop-for-days-container"]/ul/li/div/div[2]/img
   ## ${element}  Set Variable    xpath://*[@id="shop-for-days-container"]/ul/li/div/div[1]/div[2]
   ## ${className}    Set Variable    collection-item ng-scope checked

    sleep   1
    ## page should contain element      ${element}[contains(@class, '${className}')]




