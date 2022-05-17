@test1

Feature: XML

Scenario: Remove John Doe age from the XML
  * def xml =
  """
  <people>
  <person>

<forename>John</forename>
    <surname>Doe</surname>
    <age>25</age>

  </person>
  <person>
<forename>Joe</forename>
<surname>Bloggs</surname>
    <age>35</age>
  </person>
</people>

  """

Then remove xml /people/person[1]/age
  And set xml /people/person[2]
    | path      | value   |
    | forename  | 'Jane'  |
    | surname   | 'Doe'   |
    | age       | '30'    |

  And set xml /people/person[3]
    | path      | value   |
    | forename  | 'Bob'   |
    | surname   | 'Smith' |
    | age       | '40'    |

And match xml ==
  """
  <people>
    <person>
      <forename>John</forename>
<surname>Doe</surname>
</person>
<person>
<forename>Jane</forename>
<surname>Doe</surname>
<age>30</age>
</person>
<person>
<forename>Bob</forename>
<surname>Smith</surname>
<age>40</age>
</person>
</people>
  """


#Scenario: Remove Joe bloggs and age, plus Set the XML to contain Jane Doe and age 25
#Given def secondPerson = <forename>Joe</forename><surname>Bloggs</surname>
##When karate.remove('forename', '/people/person/forename')
#Then set people.person.forename == Jane
#  And set people.person.surname == Jane
#  And match
#
##Scenario: Remove Joe Bloggs and age 35 from XML
#
#Scenario: Set Bob Smith and age 40 to the XML

#  And set xml/people/person[2]/forename = <foreName2>
#  And set xml/people/person[2]/surname = <surName2>
#  And set xml/people/person[2]/age = <age2>