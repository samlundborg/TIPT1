*** Settings ***
Documentation                      Testsuite Översikt Jambalaya Funktionaliteten
Resource                           ../Resources/keywords_matglad.robot
Resource                           ../Resources/keywords_general.robot
Library                            SeleniumLibrary
Test Setup                         Begin Web Test
Test Teardown                      End Web Test

*** Test Cases ***

Hela översiktsprocessen från ett specifikt recept - Jambalaya
        [Documentation]                 Verifiera alla teststeg i testsfallen gällande funktionaliteten av Översikt
        [Tags]                          TSH-07

        User Has Access to Webpage && Clicks Recept && Page is Verified
        User Clicks On "Fredagsmys" && Page is Verified
        User Clicks On "Jambalaya" && Page is Verified
        User Clicks Overview Button && Pop-Up is Verified
        User Clicks Continue Button && Pop-Up is Verified And Shows "Ingredienser"
        User Clicks Continue Button && Pop-Up is Verified And Shows "Redskap"
        FOR    ${i}     IN RANGE  16
          IF  ${i} != 0
            Click Button Continue (>>) On Pop Up OverView Continuation
            Verify Pop-Up is at Stage   ${i}
          END
           Exit For Loop If    ${i} == 16
        END
        User Cancels The Pop Up && Jambalaya Page is Verified

