#This test is about finding all evolution possibilities for a pokemon, regardless of where the pokemon is in
# its evolution chain, and making sure the API returns all that is expected.
#1 Using PokeAPI (https://pokeapi.co/api/v2/), find a pokemon’s species URL by using its name
#2 and then use this to find
#3and call the evolution_chain endpoint.
#4 Assert that all the returned pokemon in the evolution chain are as expected.
# the test is a 3 step process with 3 separate API endpoints to
# call in order to get the information you desire.
Feature: Pokemon

Background: Define URL
  * url 'https://pokeapi.co/api/v2/'

Scenario Outline: find a pokemon’s species URL by using its name
  Given path 'pokemon-species/<name>'
  When method get
  * def evolutionResponse = response.evolution_chain.url
  And print evolutionResponse

  Given url evolutionResponse
  When method get
  Then status 200
  And match response..species.name contains only <expEvolutions>

Examples:
| name        | expEvolutions                                                                                       |
| ivysaur     | ['ivysaur', 'bulbasaur', 'venusaur']                                                                |
| eevee       | ['eevee', 'vaporeon', 'jolteon', 'flareon', 'espeon', 'umbreon', 'leafeon', 'glaceon', 'sylveon']   |
| charizard   | ['charizard', 'charmander', 'charmeleon']                                                           |
| pikachu     | ['pikachu', 'raichu', 'pichu']                                                                      |