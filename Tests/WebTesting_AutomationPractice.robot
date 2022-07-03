*** Settings ***
Resource            ../Config/Config.robot                   
Resource            ../Controllers/WebTesting_AutomationPractice_Controller.robot
Suite Setup         Run Keywords
...                 Update ChromeDriver
Test Setup          Run Keywords
...                 Given a user opens his browser in "${URL_AutomationPractice}"
Test Teardown       Close Browser with Screenshot

*** Test Cases ***
Scenario 01: Registration must complete - Natural Person
    Given a user doesn't have an account in Automation Practice
    When I submit registration form
    Then the registration must succeed

Scenario 02: Registration must not complete - First Name With Special Characters
    Given a user doesn't have an account in Automation Practice
    When I submit registration form with first name containing only special characters
    Then the registration must not succeed
    And shows a First Name invalid message
