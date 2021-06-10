*** Settings ***
Documentation                      Ändra antal personer i Inställningar
Resource                           ../Resources/keywords_general.robot
Resource                           ../Resources/keywords_installningar.robot
Library                            SeleniumLibrary
Test Setup                         Begin Web Test
Test Teardown                      End Web Test


*** Variables ***
${INSTALLNINGAR_SIDA}				Mina inställningar

*** Test Cases ***
[Documentation]  					Change number of people on Settings
[Tags]  							TSH-04

Ändra antal personer
	Go to Web Page
	Go to Inställningar
	Verify on Inställningar
	Verify default-value is 2 people
	Change number of people
	Verify number of people has changed
	Click back button
	Go to Inställningar
	Verify number of people has changed