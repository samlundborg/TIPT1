*** Settings ***
Library                                     SeleniumLibrary
Library                                     DateTime
Library                                     dateConverter.py

*** Keywords ***
Today by name
    ${CurrentDayNum}                        Today By Number
    ${CurrentDayName}                       Day Number To Swedish      ${CurrentDayNum}
    Should be Equal                         Fredag                     ${CurrentDayName}

Go to Matsedel
    Maximize Browser Window
    Go to                                    ${URL_PLANNER}
    Wait until page contains                 Veckomatsedel
    Page should contain                      Veckomatsedel

Click on todays date
    ${CurrentDay}                            Today By Number
    Click element                            xpath://*[@id="planner-view-container"]/div/div[${CurrentDay}]/div[2]/div[1]/div[2]/h4
    Sleep                                    0.3
    Wait until page contains                 Välj recept
    Wait until page contains element         xpath://*[@id="choose-buttons"]/div[2]/h3

Click on Valj recept at mig
    Sleep                                    0.3
    Click element                            xpath://html/body/div/div/div/div[2]/div/div/span/div/div/div[2]/h3
    Wait until page contains element         xpath://*[@id="random-button"]
    Page should contain element              xpath://*[@id="large-footer"]/img

Click on Spara
    Click element                            xpath://*[@id="large-footer"]/img
    Wait until location does not contain     xpath://*[@id="large-footer"]/img
    Page should not contain button           xpath://*[@id="large-footer"]/img

Click on Handla
    Click element                            xpath://*[@id="full-container"]/navigation-footer/div/div
    Page should contain element              xpath://*[@id="full-container"]/navigation-footer/div/div

Mark recipe
    Sleep                                    0.3
    Click element                            xpath://*[@id="shop-for-days-container"]/ul/li/div/div[2]/img
    Page should contain element              xpath://html/body/div/div/div/ul/li

Click on Skicka Lista
    Sleep                                    0.3
    Click element                            xpath://*[@id="shoppinglist-table"]/div/a
    Sleep                                    2