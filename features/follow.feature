Feature: Adding a list to your library
  Background: 
    Given the visitor is on the map page
    And there is a reading list in the database
  @javascript
  Scenario: A member favourites/follows a list
    Given they view a list
    And the click the "follow" button
    Then the button should change to "Following" 
    When the member navigates to "My library"
    Then they should see the list they followed