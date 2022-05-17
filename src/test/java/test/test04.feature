#Using PokeAPI (https://pokeapi.co/api/v2/), return all the information for the pokemon
#‘Pikachu’ by calling the correct endpoint. Check the API documentation for correct
#usage guidance (Documentation - PokéAPI (pokeapi.co).
#You should:
#Assert that the HTTP response status is 200
#Print the response and examine the format of data returned
#The data returned will be used in following tests so examine the structure and how it is presented.
Feature: PokeAPI

  Background: Define URL
    Given url 'https://pokeapi.co/api/v2/'

  Scenario: Return PokeApi info

  Given path 'pokemon/pikachu'
  When method get
  Then status 200
  And print response