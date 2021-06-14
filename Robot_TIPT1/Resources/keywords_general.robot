*** Settings ***

*** Variables ***

#MatGlad General Info
${BROWSER}                   chrome
${URL_HOMEPAGE}              http://app.matglad.nu/#/startview
${URL_RECIPE}                http://app.matglad.nu/#/recipe-categories
${URL_TITLE}				 Matglad
${URL_PLANNER}               http://app.matglad.nu/#/planner
${i}                         1
${INSTALLNINGAR_SIDA}		 Mina inställningar


*** Keywords ***
Begin Web Test
    Open browser                     about:blank             ${BROWSER}
    Maximize Browser Window
    Set selenium timeout             10


Go to Web Page
    Load Page
    Verify Page Loaded

Load Page
    Go to                           ${URL_HOMEPAGE}

Verify Page Loaded
    ${LINK_TEXT}                    Get Title
    Should Be Equal                 ${LINK_TEXT}      Matglad
    Page Should Contain             Matglad

End Web Test
    Close Browser

