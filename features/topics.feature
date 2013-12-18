Feature: Topics
  Background: 
    Given A signed in visitor has choosen a trend from a list
    When a visitor clicks "Save and view"
  @javascript
  Scenario: A member adds a topic to a list
    When they give a list a topic
    And the click the "Add topic" button
    Then the topic appears
