@test
Feature: This is a sample Karate test file
  Background:
  # This section configures the testing environment
  # I.e. Define the test input and your assertion/expected result
    Given url 'https://www.google.com/'
  # The 'Given' keyword configures the test environment
  #And header Authorisation = "Some 128Bit key as string"
  # The above line is needed to decrypt an encrypted site (E.g. A Jira work board)
  #And path '<string>'
  # Remember that you need to read the documentation for the target for how to control the site using code
  Scenario: This should expand on what part of the feature is being tested
  # This is the section where the test is executed
  # There can be multiple scenarios in a feature file
    When method GET
    Then status 200
  # The 'Then' keyword states your assertion/expected result
    And print response
    And match response.total != 5
  # The 'match' keyword is used for a logical test