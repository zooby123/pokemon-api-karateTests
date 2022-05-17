Feature: Pokemon

  Background: Define URL
    * url 'https://pokeapi.co/api/v2/'
    * def prettyPrint =
            """
            function(response) {return 'ID ' + response.id + ': ' + titleCase(response.name) +
            ' ' + '(' + nameTypes + ') ' + 'ATK:' + response.stats[1].base_stat + ' '+ 'DEF:' + response.stats[2].base_stat}
            """

# ToDo 1:In this scenario we want to have a TABLE of pokemon names and use karate.repeat() to loop through our table
#  of names and call another Scenario which will fetch the data and pretty print the data for our chosen pokemon before
#  it is returned to the original Scenario. You can refactor your code from Test 08 to save time for this second
#  scenario. The pretty printed pokemon data is returned in an array. Create a JS function to loop through this
#  array and format the array in a nicer way. For example, I formatted my data as [POKEMON DATA] [NEWLINE CHARACTER]
#  for each line of pokemon data.
  Scenario: Get the information from the Pokemon and print out this info in a ‘pretty’ format.
#    * path 'pokemon/<pokemon>'
#    * method get
#    * match contains ==

    * table pokemon
        | name       |
        |'charizard' |
        |'machamp'   |
        |'jigglypuff'|
    * def func =
      """
      function()
      """
    * def loop = karate.repeat(3, pokemon)
    * print loop

# ToDo 2: Once this is nicely formatted, create a JAVA class which will write a string to a file.
#  We can then call this Java class from within our Scenario to write our newly formatted data to a text file.
#Finally, read back the contents of your text file and use MATCH CONTAINS to ensure that all your passed in data has
# been correctly written to the file.
#
#    Scenario: