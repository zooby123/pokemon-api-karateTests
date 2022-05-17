Feature: XML
Scenario: Check timestamp is a string and present
Given def file =
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
  <timestamp>30/01/2021 12:59:00</timestamp>
</people>
  """
#Then match file == </person><timestamp>'#present'</timestamp> </people>
Then match file ==
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
  <timestamp>#present</timestamp>
</people>
  """
  And match file ==
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
  <timestamp>#string</timestamp>
</people>
  """
  And match file ==
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
  <timestamp>#ignore</timestamp>
</people>
  """

