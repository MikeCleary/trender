Feature: Moderator deletes content
  Background: 
    Given a moderator is logged in
    Given a moderator is viewing a list with comments
  @javascript
  Scenario:
    When he deletes a comment
    And the comment is gone
  @javascript
  Scenario:
    When he deletes a list
    When he views the list index
    And the list is gone

