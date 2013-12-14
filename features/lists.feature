Feature: Reading lists
  Background: 
    Given A signed in visitor has choosen a trend from a list
  @wip @javascript
  Scenario: a visitor saves a reading list
    When a visitor clicks "Save and view"
    Then they a taken to their lists view
    And they see their new list
