Feature: Searchable
  Background: 
    Given There are distinct readinglists in the database
    And We have built the sphinx index for them
  @wip
  Scenario: A visitor searches for reading lists by title
    Given the visitor is on a page
    When the put "Title to be found" into the seach field
    And the click the "Search" button
    Then they should see the reading list "Title to be found"
