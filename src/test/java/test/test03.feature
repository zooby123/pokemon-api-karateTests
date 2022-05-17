#Create a JS function which accepts 1 string parameter (which will all be in lowercase),
#and converts the first character of the string to uppercase and then returns the modified string.
#This JavaScript function can be written within the Scenario but should ideally be moved into the ‘common’
#folder and referenced within your Scenario.
##Test your new JS function by calling it with any test data and then asserting that it works correctly by using MATCH. For example:
#hElLo -> Hello
#TeSt -> Test
#workING - > Working

Feature: lower case helper method
Background:
#  * def titleCase =
#      """
#      function(data) {return data.split(' ').map(item => item.charAt(0).toUpperCase() + item.slice(1).toLowerCase()).join(' ')}
#      """

  Scenario: title case the strings
#    * def unresolvedWords = 'hElLo', 'TeSt', 'workING'
#    * def resolvedWords = titleCase(unresolvedWords)
#    * match resolvedWords == ('Hello', 'Test', 'Working')

    * def test = call read('../common/common.feature')
    * def unresolvedWords = 'hElLo', 'TeSt', 'workING'
    * def resolvedWords = test.titleCase(unresolvedWords)
    * match resolvedWords == ['Hello', 'Test', 'Working']
