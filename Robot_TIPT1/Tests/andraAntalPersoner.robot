*** Settings ***
Documentation                      Ändra antal personer i Inställningar
Resource                           ../Resources/keywords_general.robot
Resource                           ../Resources/keywords_installningar.robot
Library                            SeleniumLibrary
Test Setup                         Begin Web Test
Test Teardown                      End Web Test


*** Variables ***
${INSTALLNINGAR_SIDA}					Mina inställningar

*** Test Cases ***

Ändra antal personer
	Go to Web Page
	Go to Inställningar
	Verify on Inställningar
	Verify default-värde är 2 personer