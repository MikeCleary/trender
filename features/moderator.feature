Feature: Moderator deletes content
  Background: 
    Given a moderator is logged in
    Given a moderator is viewing a list
  @javascript
  Scenario:
    When he deletes a comment
    Then the page reloads
    And the comment is gone
  @javascript
  Scenario:
    When he deletes a list
    Then the page reloads
    And the list is gone

