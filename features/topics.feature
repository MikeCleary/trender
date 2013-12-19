Feature: Topics
  Background: 
    Given A signed in visitor has choosen a trend from a list
    When a visitor clicks "Save and view"
  @wip @javascript
  Scenario: A member adds a topic to a list
    When they click "edit list details" link
    And they give a list a topic
    And the click the "Add topic" button
    Then the topic appears
    And the member navigates to "View all lists"
    When they click "Jam" link
    Then they see the story with that topic

