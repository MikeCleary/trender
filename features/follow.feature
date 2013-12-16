Feature: Adding a list to your library
  Background: 
    Given the visitor is on the map page
    And there are 15 reading lists in the database
    And the member navigates to "View all lists"
  @wip
  Scenario: A member favourites/follows a list
    Given they view a list
    And the click the "Add to my followed lists" button
    And the member navigates to "My library"
    Then they should see the list they followed