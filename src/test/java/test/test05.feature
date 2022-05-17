#Using PokeAPI (https://pokeapi.co/api/v2/) and an Examples table within a Scenario Outline,
#provide the name of a pokemon and an array/collection of their ‘types’ and ensure
#that the values returned match those that you expect.
#You can prove this using two different MATCH statements.
#One MATCH to check the contents match the correct order and one MATCH to check that the contents match,regardless of their order in the array.
#Use the provided Examples table below within your test and examine how to efficiently use
#JSONPath, there are good examples within the GitHub page.
Feature: PokeAPI

  Background: Define URL
    Given url 'https://pokeapi.co/api/v2/'

  Scenario Outline: Tests the contents match,regardless of their order in the array.

    Given path 'pokemon/<name>'
    When method get
    Then status 200
    And match response.types[*].type.name contains <type>

    Examples:
      | name      | type                |
      | golem     | ['ground', 'rock']  |
      | ditto     | ['normal']          |
      | pikachu   | ['electric']        |
      | mewtwo    | ['psychic']         |
      | scizor    | ['bug', 'steel']    |
      | bulbasaur | ['grass', 'poison'] |


  Scenario Outline: check the contents match the correct order and array/collection of their types

    Given path 'pokemon/<name>'
    When method get
    Then status 200
    And match response.types[*].type.name == <type>

    Examples:
      | name      | type                |
      | golem     | ['ground', 'rock']  |
      | ditto     | ['normal']          |
      | pikachu   | ['electric']        |
      | mewtwo    | ['psychic']         |
      | scizor    | ['bug', 'steel']    |
      | bulbasaur | ['grass', 'poison'] |