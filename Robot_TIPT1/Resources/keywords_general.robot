*** Settings ***

*** Variables ***

#MatGlad General Info
${BROWSER}                   chrome
${URL_HOMEPAGE}              http://app.matglad.nu/#/startview
${URL_RECIPE}                http://app.matglad.nu/#/recipe-categories

*** Keywords ***
Begin Web Test
    Open browser                     about:blank             ${BROWSER}
    Set selenium timeout             10

Go to Web Page
    Load Page
    Verify Page Loaded

Load Page
    Go to                           ${URL_HOMEPAGE}

Verify Page Loaded
    ${LINK_TEXT}                    Get Title
    Should Be Equal                 ${LINK_TEXT}      Matglad
    Page Should Contain             Welcome to Petclinic

End Web Test
    Close Browser