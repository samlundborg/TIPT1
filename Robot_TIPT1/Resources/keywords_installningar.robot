*** Settings ***

Library                            				SeleniumLibrary

*** Keywords ***

Go to Inställningar
	Click element								id:settings-btn
	Wait until page contains					${INSTALLNINGAR_SIDA}

Verify on Inställningar
	Page should contain							${INSTALLNINGAR_SIDA}

Verify default-value is 2 people
	Page should contain element					xpath://*[@id="portions-men"]/li[1]
	Page should contain element					xpath://*[@id="portions-men"]/li[2]
	Page should not contain element				xpath://*[@id="portions-men"]/li[3]
	Page should not contain element				xpath://*[@id="portions-men"]/li[4]

Change number of people
	Sleep										0.2 s
	Click element								xpath://*[@id="num-portions-list"]/li[1]
	Wait until page does not contain element	xpath://*[@id="portions-men"]/li[2]

Verify number of people has changed
	Page should contain element					xpath://*[@id="portions-men"]/li[1]
	Page should not contain element				xpath://*[@id="portions-men"]/li[2]
	Page should not contain element				xpath://*[@id="portions-men"]/li[3]
	Page should not contain element				xpath://*[@id="portions-men"]/li[4]

Click back button
	Click element								id:back-button
	Wait until page contains					${URL_TITLE}
	Sleep										0.3 s
	Page should contain							${URL_TITLE}




