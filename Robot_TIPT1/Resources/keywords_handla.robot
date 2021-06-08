*** Settings ***

Library                     SeleniumLibrary
Library                     DateTime
*** Variables ***

##${CurrentDay}    Get Current Date    result_format=%d
##Log    ${CurrentDay}

*** Keywords ***


Go to Matsedel
   Click element       id=planner-btn           RETURN
   Wait until page contains     Veckomatsedel

Click on todays date
    set selenium speed      0.5
   ${CurrentDay}        Get Current Date        result_format=%u
   Click element  //*[@id="planner-view-container"]/div/div[${CurrentDay}]/div[2]/div[1]/div[1]/h3     RETURN

Click on

