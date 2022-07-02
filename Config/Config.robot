*** Settings ***
### MAIN LIBRARIES
Library         SeleniumLibrary     timeout=15s     run_on_failure=Add screenshot
Library         FakerLibrary        locale=pt_BR
### NEEDED RESOURCES
Resource        Data.robot

*** Variables ***
${BROWSER}      headlesschrome      #chrome        #headlesschrome

*** Keywords ***
### MAIN KEYWORDS
Given a user opens his browser in "${URL}"
    Open Browser
    ...     ${URL}
    ...     ${BROWSER}
    ...     executable_path=${chromedriver_path}
    ...     options=add_argument("--incognito"); add_argument("--ignore-certificate-errors"); add_argument("--start-maximized"); add_argument("--disable-popup-blocking"); add_argument("--disable-notifications"); add_argument("--disable-extensions"); add_argument("--disable-web-security"); add_argument("--window-size=1920,1080")
    Maximise Browser Window

Close Browser with Screenshot
    Add screenshot
    Close Browser

Update ChromeDriver
    ${chromedriver_path}    Get ChromeDriver Path
    Set Global Variable     ${chromedriver_path}

