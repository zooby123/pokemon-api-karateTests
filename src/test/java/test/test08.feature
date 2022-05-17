#Get all of the information for the Pokemon ‘charizard’ and print out this information in a ‘pretty’ format.
#This can be achieved through the use of a custom JS function and this function should be reusable for all Pokemon
#regardless of what data is returned and data should be formatted as:
#ID : NAME (TYPES) ATK:ATTACK_BASE_STAT DEF:DEFENCE_BASE_STAT
#ID 6: Charizard (FIRE, FLYING) ATK:84 DEF:78
#Note the capital letter at the beginning of the name and the capitalisation of the rest of the string. The values
#highlighted in RED are values taken from the API call, other characters have been added as part of the custom
#‘pretty’ print function.
Feature: Pokemon

  Background: Define URL
    * url 'https://pokeapi.co/api/v2/'
    * def titleCase =
            """
            function(data) {return data.split(' ').map(item => item.charAt(0).toUpperCase() + item.slice(1).toLowerCase())}
            """
#    TODO 2: Put all the functions in common file
  Scenario Outline: Get the information from the Pokemon and print out this info in a ‘pretty’ format.
    Given path 'pokemon/<name>'
    When method get
    * def forLoops =
    """
    function(arg){
      var emptyArray = [];
      for(var i = 0; i < arg.types.length; i++){
      var typeName = arg.types[i].type.name.toUpperCase();
      emptyArray.push(typeName);}
      var consolidatedNames = emptyArray.join(', ');
      return consolidatedNames;
       }
    """
    * def types = response.types
    * def nameTypes = call forLoops response
    * def prettyPrint =
    """
    function(response) {return 'ID ' + response.id + ': ' + titleCase(response.name) +
    ' ' + '(' + nameTypes + ') ' + 'ATK:' + response.stats[1].base_stat + ' '+ 'DEF:' + response.stats[2].base_stat}
    """
    * def return = call read('../common/common.feature')
    * def expectedResult = prettyPrint(response)
    * match expectedResult == <expPrettyPrint>

Examples:
| name        | expPrettyPrint                                    |
| charizard   | 'ID 6: Charizard (FIRE, FLYING) ATK:84 DEF:78'    |
| machamp     | 'ID 68: Machamp (FIGHTING) ATK:130 DEF:80'        |
| jigglypuff  | 'ID 39: Jigglypuff (NORMAL, FAIRY) ATK:45 DEF:20' |