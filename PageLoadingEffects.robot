*** Settings ***
Library    Selenium2Library
Library    BuiltIn

*** Variables ***
${PAGELOAD_OVERLAY}    //div[@class="pageload-overlay"]
${BUTTON_SHOW_PAGE_LOADER}    //a[@class="pageload-link"][text()="Show Page Loader"]
${BUTTON_GO_BACK}    //a[@class="pageload-link"][text()="Go back"]

*** Test Cases ***

1. Open Website
    Open Browser    https://tympanus.net/Development/PageLoadingEffects/    browser=chrome
    Set Selenium Speed    0.3
    Maximize browser Window

2. FOR IN ENUMERATE
    @{ITEMS}    Create List    Lazy Stretch    Circle    Spill    Frame it
    FOR    ${INDEX}    ${ELEMENT}    IN ENUMERATE    @{ITEMS}
        Wait Until Page Contains Element     ${PAGELOAD_OVERLAY}
        Click Element    //a[text()="${ELEMENT}"]
        Log To Console    ${ELEMENT}
        Click Element    ${BUTTON_SHOW_PAGE_LOADER}
        Wait Until Page Contains Element    ${PAGELOAD_OVERLAY}
        Click Element    ${BUTTON_GO_BACK}
    END
#or
#For-in-enumerate
#    FOR    ${index}    ${item}    IN ENUMERATE    Lazy Stretch    Circle    Spill    Frame it
#        Log To Console   \n${index}
#        Log To Console   ${item}
#    END    -> 0 Lazy Stretch    1 Circle    2 Spill    3 Frame it

