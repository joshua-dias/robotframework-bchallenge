*** Settings ***
Resource    ../../Config/Config.robot

*** Variables ***
${URL_AutomationPractice}       http://automationpractice.com/

### LANDING PAGE
${button_signin}                xpath=//a[@class='login'][contains(.,'Sign in')]
${image_logo}                   xpath=//img[contains(@class,'logo img-responsive')]

### SIGN IN PAGE
${page_Heading}                 xpath=//h1[@class='page-heading'][contains(.,'Authentication')]
${input_emailaddress}           id=email_create
${button_submitcreate}          id=SubmitCreate                 


### REGISTRATION PAGE
${page_Heading_CreateAccount}   xpath=//h1[@class='page-heading'][contains(.,'Create an account')]
${input_title}                  id=id_gender1
${input_firstname}              id=customer_firstname
${input_lastname}               id=customer_lastname
${input_email}                  id=email    
${input_password}               xpath=//input[contains(@type,'password')]
${input_address_firstname}      id=firstname
${input_address_lastname}       id=lastname
${input_address}                id=address1
${input_city}                   id=city
${select_state}                 id=id_state
${input_zipcode}                id=postcode
${select_country}               id=id_country
${input_mobilephone}            id=phone_mobile
${input_addressalias}           id=alias

${button_submit}                id=submitAccount
${firstname_error}              xpath=//li[contains(.,'firstname is invalid.')]

### MY ACCOUNT PAGE 
${page_Heading_MyAccount}       xpath=//h1[@class='page-heading'][contains(.,'My account')]

*** Keywords ***
### GIVEN
a user doesn't have an account in Automation Practice
    Generate Data for Registration
    Wait Until Page Contains Element    ${image_logo} 
    Click Element    ${button_signin}
    Wait Until Page Contains Element    ${page_Heading}
    Fills field        ${input_emailaddress}    ${client_Email}
    Click Element      ${button_submitcreate}


### WHEN
I submit registration form
    Wait Until Page Contains Element    ${page_Heading_CreateAccount}
    Fills title
    Fills field        ${input_firstname}                ${client_FirstName}
    Fills field        ${input_lastname}                 ${client_LastName}
    Fills field        ${input_email}                    ${client_Email} 
    Fills field        ${input_password}                 ${client_Password}
    Fills field        ${input_address_firstname}        ${client_FirstName}
    Fills field        ${input_address_lastname}         ${client_LastName}
    Fills field        ${input_address}                  ${client_Address}
    Fills field        ${input_city}                     ${client_City}             
    Select From List By Label    ${select_state}     ${client_State}          
    Fills field        ${input_zipcode}       ${client_postalcode}               
    Select From List By Label    ${select_country}   ${client_Country}
    Fills field        ${input_mobilephone}              ${client_PhoneNumber}
    Fills field        ${input_addressalias}             ${client_AddressAlias}
    Click Element      ${button_submit}
    
I submit registration form with first name containing only special characters
    Special Characters    3 
    Set Test Variable    ${client_FirstName}    ${special_character}${special_character}
    Log To Console       ---------------------------
    Log To Console       NAME WITH SPECIAL CHARACTERS: ${client_FirstName}
    I submit registration form

### THEN
the registration must not succeed with an invalid message
    Wait Until Page Contains Element 
    ...     ${firstname_error}
    ...     error=Locator ${firstname_error} not found.
    Log To Console    -----REGISTRATION DID NOT HAPPEN - FIRST NAME IS INVALID
the registration must succeed
    Wait Until Page Contains Element   
    ...     ${page_Heading_MyAccount}
    ...     error=Locator ${page_Heading_MyAccount} not found.
    Log To Console    -----SUCCESFULL REGISTRATION
