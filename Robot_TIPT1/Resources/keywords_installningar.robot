*** Settings ***
Documentation                      Ändra antal personer i Inställningar
Resource                           ../Resources/keywords_general.robot
Resource                           ../Resources/keywords_installningar.robot
Library                            SeleniumLibrary

*** Keywords ***

Go to Inställningar
	Set selenium speed				0.2			# ta bort när testerna är klara
	Click element					id:settings-btn
	Wait until page contains		${INSTALLNINGAR_SIDA}

Verify on Inställningar
	Page should contain				${INSTALLNINGAR_SIDA}

Verify default-värde är 2 personer
	Page should contain element			xpath://*[@id="portions-men"]/li[1]
	Page should contain element			xpath://*[@id="portions-men"]/li[2]
	Page should not contain element		xpath://*[@id="portions-men"]/li[3]
	Page should not contain element		xpath://*[@id="portions-men"]/li[4]


