Feature: Searchable
  Background: 
    Given There are distinct readinglists in the database
    And We have built the sphinx index for them
  
  Scenario: A visitor searches for reading lists by title
    Given the visitor is on a page
    When they put "Title to be found" into the search field
    And the click the "search" button
    Then they should see the reading list "Title to be found"
  
  Scenario: A visitor searches and finds nothing
    Given the visitor is on a page
    When they put "Not in database" into the search field
    And the click the "search" button
    Then they should see a message telling them nothing was found