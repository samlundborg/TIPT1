*** Settings ***
Documentation                      Testsuite TIPT1
Resource                           ../Resources/keywords_matglad.robot
Resource                           ../Resources/keywords_general.robot
Resource                           ../Resources/keywords_installningar.robot
Resource                           ../Resources/keywords_handla.robot
Library                            ../Resources/dateConverter.py
Library                            DateTime
Library                            SeleniumLibrary
Test Setup                         Begin Web Test
Test Teardown                      End Web Test

*** Variables ***
${INSTALLNINGAR_SIDA}				        Mina inställningar

*** Test Cases ***

Ändra antal personer
	[Documentation]  						Ändra antal personer i Inställningar
	[Tags]  								TSH-04
	Go to Web Page
	Go to Inställningar
	Verify on Inställningar
	Verify default-value is 2 people
	Change number of people
	Verify number of people has changed
	Click back button
	Go to Inställningar
	Verify number of people has changed

Handla Test
    [Documentation]                         Flow of Handla
    [Tags]                                  TSH-01

    Go to Web Page
    Go to Matsedel
    Click on todays date
    Click on Valj recept at mig
    Click on Spara
    Click on Handla
    Mark recipe
    Click on Handla
    Click on Skicka Lista

Hela översiktsprocessen från ett specifikt recept - Jambalaya
    [Documentation]                          Verifiera alla teststeg i testsfallen gällande funktionaliteten av Översikt
    [Tags]                                   TSH-07

    User Has Access to Webpage && Clicks Recept && Page is Verified
    User Clicks On "Fredagsmys" && Page is Verified
    User Clicks On "Jambalaya" && Page is Verified
    User Clicks Overview Button && Pop-Up is Verified
    User Clicks Continue Button && Pop-Up is Verified And Shows "Ingredienser"
    User Clicks Continue Button && Pop-Up is Verified And Shows "Redskap"
    Navigate Through All Stages of Pop-Ups Regarding Overview
    User Cancels The Pop Up && Jambalaya Page is Verified



