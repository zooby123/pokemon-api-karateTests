Feature: This is a common used section

  Background:
    * url 'https://pokeapi.co/api/v2/'

    Scenario:
#      * def test = call read('../test/test.feature')
      * def titleCase =
            """
            function(data) {return data.split(' ').map(item => item.charAt(0).toUpperCase() + item.slice(1).toLowerCase())}
            """
      * def upperCase =
            """
            function(data) {return data.toUpperCase()}
            """
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
      * def expectedResult = prettyPrint(response)