  
Feature: Select country from a map and trends from list
  
  Background: 
    Given the visitor is on the map page
    And there are trends in the database
    And there are stories in the database for that trend

  @javascript
  Scenario: A visitor chooses a country from a map
    When the visitor clicks on a country
    Then trends are returned for that country

  @javascript
  Scenario: A visitor chooses a trend from a list
    When the visitor clicks on a country
    Then trends are returned for that country
    And the visitor clicks on a trend
    Then a list of stories for this trend appear
    When the visitor clicks the "Add" button on a story
    Then the story appears in the users reading list