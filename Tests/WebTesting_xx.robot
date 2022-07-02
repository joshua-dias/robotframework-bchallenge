*** Settings ***
Resource            ../../Config/Config.robot                   
Resource            ../../Controllers/WebTesting_xx_Controller.robot
Suite Setup         Run Keywords
...                 Update ChromeDriver
Test Setup          Run Keywords
...                 Given a user opens his browser in "${URL}"
Test Teardown       Close Browser with Screenshot

*** Test Cases ***
Scenario 01: 