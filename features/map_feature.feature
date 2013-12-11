Feature: Select country from a map
  @javascript
  Scenario: A visitor chooses a country from a map
    Given the visitor is on the map page
    And thier are trends in the database
    When the visitor clicks on a country
    Then trends are returned for that country