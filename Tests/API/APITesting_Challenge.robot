### These tests are commented cause were asked only for the scenarios itself. 

*** Test Cases ***
#Scenario 01: Search for Organizations must work - Correct Query
#    [Documentation] Success scenario created so we test the Get Organizations with valid data.
#    Given a user is trying to find an organization
#    When he searches for a organization with valid data
#    Then the search must give a response with all the organizations that matches the query

#Scenario 02: Search for Organizations must not work - City from a different country than chosen
#    [Documentation] Failure scenario where the user searchs for a city that doesn't exists in the given country.
#    Given a user is trying to find an organization
#    When he searches for a organization in a city that doens't exists in the given country
#    Then we must had an error with "Invalid Request" title