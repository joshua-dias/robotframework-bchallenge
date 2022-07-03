*** Settings ***
### MAIN LIBRARIES
Library         SeleniumLibrary     timeout=15s     run_on_failure=Close Browser with Screenshot
Library         FakerLibrary        locale=en_US
Library    String

### RESOURCES
Resource    ../Controllers/WEB/WebTesting_AutomationPractice_Controller.robot

*** Variables ***
${BROWSER}      chrome      #chrome        #headlesschrome

*** Keywords ***
### MAIN KEYWORDS
Given a user opens his browser in "${URL}"
    Open Browser
    ...     ${URL}
    ...     ${BROWSER}
    ...     executable_path=${chromedriver_path}
    ...     options=add_argument("--incognito"); add_argument("--ignore-certificate-errors"); add_argument("--start-maximized"); add_argument("--disable-popup-blocking"); add_argument("--disable-notifications"); add_argument("--disable-extensions"); add_argument("--disable-web-security"); add_argument("--window-size=1920,1080")
    Maximize Browser Window

Close Browser with Screenshot
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png
    Close Browser

Update ChromeDriver
    [Documentation]   This keyword was created so it's not needed to care about updating the chromedriver, webdriver-manager library does that itself.
    ${chromedriver_path}       Get ChromeDriver Path
    Set Global Variable     ${chromedriver_path}

Generate Data for Registration
    Log To Console  ----- GENERATING DATA FOR REGISTRATION FORM
    Generate First Name
    Generate Last Name
    Generate Email
    Generate Password
    Generate Address
    Generate City
    Generate PostCode
    Generate State
    Generate Country
    Generate Phone
    Generate Address Alias   

Fills title
    ${fieldTitle}   Create List
    ...     1
    ...     2
    ${fieldTitleReturn}     Evaluate    random.choice(${fieldTitle})
    Set Test Variable   ${input_title}      id=id_gender${fieldTitleReturn}
    Click Element       ${input_title}

Fills field
    [Arguments]     ${field}    ${text}
    Wait Until Element Is Enabled   ${field}
    Click Element   ${field}
    Input Text      ${field}    ${text}

Generate First Name
    ${client_FirstName}     FakerLibrary.First Name
    Set Test Variable       ${client_FirstName}
    Log To Console          FIRST NAME: ${client_FirstName}

Generate Last Name
    ${client_LastName}      FakerLibrary.Last Name
    Set Test Variable       ${client_LastName}
    Log To Console          LAST NAME: ${client_LastName}

Generate Email
    ${client_Email}      FakerLibrary.Email
    Set Test Variable       ${client_Email} 
    Log To Console          EMAIL: ${client_Email} 

Generate Password
    Numerical Characters    10
    Set Test Variable       ${client_Password}      ${numerical_character}
    Log To Console          PASSWORD: ${client_Password} 

Generate Address
    ${client_Address}       FakerLibrary.Street Address
    Set Test Variable       ${client_Address}
    Log To Console          ADDRESS: ${client_Address}

Generate Phone
    ${client_PhoneNumber}   Random Int    2000000000    9999999999    1
    Set Test Variable       ${client_PhoneNumber}
    Log To Console          PHONE NUMBER: ${client_PhoneNumber}

Generate Address Alias  
    Set Test Variable       ${client_AddressAlias}       "${client_FirstName}'s House"
    Log To Console          ADDRESS ALIAS: ${client_AddressAlias}

Generate City
    ${client_City}  FakerLibrary.City
    Set Test Variable       ${client_City} 
    Log To Console          CITY: ${client_City} 
Generate PostCode
    ${client_postalcode}   FakerLibrary.Postalcode
    Set Test Variable       ${client_postalcode} 
    Log To Console          POSTALCODE: ${client_postalcode} 

Generate State
    ${client_State}   FakerLibrary.State
    Set Test Variable       ${client_State} 
    Log To Console          STATE: ${client_State} 

Generate Country
    [Documentation]    I'm only using United States cause it's the only country this website allows.
    Set Test Variable       ${client_Country}    United States
    Log To Console          COUNTRY: ${client_Country}

Special Characters
    [Documentation]    You should define how many special characters you want by informing the lenght.
    [Arguments]    ${length}
    ${special_character}    FakerLibrary.Password
    ...    length=${length}
    ...    special_chars=True
    ...    digits=False
    ...    upper_case=False
    ...    lower_case=False
    Set Test Variable    ${special_character}

Numerical Characters
    [Documentation]    You should define how many special characters you want by informing the lenght.
    [Arguments]    ${lenght}
    ${numerical_character}    FakerLibrary.Random Number
    ...    digits=${lenght}
    Set Test Variable    ${numerical_character}