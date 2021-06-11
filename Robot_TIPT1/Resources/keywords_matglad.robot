*** Settings ***

*** Keywords ***

### Click Different Categories On MatGlad Here

Click "ReceptVäljaren"
    Sleep                                    0.4
    Click Element                            xpath://html/body/div/div/div/div/div[1]/a[2]

Click "Fredagsmys"
    Click Element                            xpath://html/body/div/div/div/collection-view/ul/li[6]/a/div/img

Click "Jambalaya"
    Click Element                            xpath://html/body/div/div/div/collection-view/ul/li[7]/a/div/img

### Verify Pages Loaded On Different Pages Here

Verify Page "ReceptVäljaren" Loaded
    Sleep                                    0.4
    Wait Until Page Contains Element         xpath://html/body/div/navigation-bar/div/h1
    Wait Until Element is Enabled            xpath://html/body/div/navigation-bar/div/h1
    ${verify_text}                           Get Text                        xpath://html/body/div/navigation-bar/div/h1
    Should Be Equal                          ${verify_text}                  ReceptVäljaren

Verify Page "Fredagsmys" Loaded
    Sleep                                    0.4
    Wait Until Page Contains Element         xpath://html/body/div/navigation-bar/div/h1
    Wait Until Element is Enabled            xpath://html/body/div/navigation-bar/div/h1
    ${verify_text}                           Get Text                        xpath://html/body/div/navigation-bar/div/h1
    Should Be Equal                          ${verify_text}                  Fredagsmys

Verify Page "Jambalaya" Loaded
    Sleep                                    0.4
    Wait Until Page Contains Element         xpath://html/body/div/navigation-bar/div/h1
    Wait Until Element is Enabled            xpath://html/body/div/navigation-bar/div/h1
    ${verify_text}                           Get Text                        xpath://html/body/div/navigation-bar/div/h1
    Should Be Equal                          ${verify_text}                  Jambalaya

Verify Pop-Up "Jambalaya" Overview Loaded
    Sleep                                    0.5
    Wait Until Page Contains                 Översikt -
    Page Should Contain                      Översikt -

### Click Different Buttons Here

Click Button "Översikt"
    Click Element                           xpath://html/body/div/div/div/div[1]

Click Button Continue (>>) On Pop Up OverView
    Click Element                           xpath://html/body/div/div/div/div[4]/div/div/div[3]/img

Click Button Continue (>>) On Pop Up OverView Continuation
    Click Element                           xpath://html/body/div/div/div/div[4]/div/div/div[3]/img[2]

Click Button Cancel (x) On Pop Up OverView
    Click Element                           xpath://html/body/div/div/div/div[4]/a/img

CkClick Button Cancel (x) On Pop Up OverView With Mouse Left Click
    Mouse Down                              xpath://html/body/div/div/div/div[4]/a/img
    Mouse Up                                xpath://html/body/div/div/div/div[4]/a/img

### Verify Pop-Up Boxes Shown Different Stages

Verify Pop-Up Contains "Ingredienser"
    Wait Until Page Contains                       Ingredienser

Verify Pop-Up Contains "Redskap"
    Wait Until Page Contains                       Redskap

Verify Pop-Up is at Stage
    [Arguments]                                   ${i}
    Wait Until Page Contains                      Steg ${i}

### Refactoring for Testcases - For everyone's reuse

Navigate Through All Stages of Pop-Ups Regarding Overview
    FOR    ${i}     IN RANGE  16
          RUN KEYWORD IF  ${i} != 0  Verify Pop-Up Stages Confirmed     ${i}
              EXIT FOR LOOP IF    ${i} == 16
    END

Verify Pop-Up Stages Confirmed
    [Arguments]                 ${i}
    Click Button Continue (>>) On Pop Up OverView Continuation
    Verify Pop-Up is at Stage   ${i}

User Has Access to Webpage && Clicks Recept && Page is Verified
    Go to Web Page
    Click "ReceptVäljaren"
    Verify Page "ReceptVäljaren" Loaded

User Clicks On "Fredagsmys" && Page is Verified
    Click "Fredagsmys"
    Verify Page "Fredagsmys" Loaded

User Clicks On "Jambalaya" && Page is Verified
    Click "Jambalaya"
    Verify Page "Jambalaya" Loaded

User Clicks Overview Button && Pop-Up is Verified
    Click Button "Översikt"
    Verify Pop-Up "Jambalaya" Overview Loaded

User Clicks Continue Button && Pop-Up is Verified And Shows "Ingredienser"
    Click Button Continue (>>) On Pop Up OverView
    Verify Pop-Up Contains "Ingredienser"

User Clicks Continue Button && Pop-Up is Verified And Shows "Redskap"
    Click Button Continue (>>) On Pop Up OverView
    Verify Pop-Up Contains "Redskap"

User Clicks Continuation Button && Pop-Up is Verified And Shows Stage 1
    Click Button Continue (>>) On Pop Up OverView Continuation

User Cancels The Pop Up && Jambalaya Page is Verified
    Click Button Cancel (x) On Pop Up OverView
    Verify Page "Jambalaya" Loaded
