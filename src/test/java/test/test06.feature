#Using PokeAPI (https://pokeapi.co/api/v2/) and an Examples table within a Scenario Outline, provide the name of a
#pokemon and an array/collection of their ‘abilities’ and ensure that the number of values returned match those that you expect.
#Note that we do not care about the values returned, just the number of results.
#You should look at Schema Validation to figure out how to do this. It can be performed by both using ASSERT and MATCH
#so try to find both ways.
Feature: PokeAPI

  Background: Define URL
    Given url 'https://pokeapi.co/api/v2/'
#    * def noOfValues = function(o){ return o.name.length == 1 }
#    * match $.odds == '#[]? noOfValues(_)'

  Scenario Outline: 

    Given path 'pokemon/<name>'
    When method get
    Then status 200
    And match response.abilities[*].ability.name == <abilities>
    And match response.abilities[*].ability.name == '#[<length>] #string'
#    And match response.abilities[*].ability.name == '#[<abilities>]? _.length == <length>'
#    And match response.abilities[*].ability.name == '#[<abilities>] #string? .length == <length>'

    Examples:
      | name      | abilities                                 | length |
      | blastoise | ['torrent', 'rain-dish']                  | 2      |
      | weedle    | ['shield-dust', 'run-away']               | 2      |
      | pidgeot   | ['keen-eye', 'tangled-feet', 'big-pecks'] | 3      |
