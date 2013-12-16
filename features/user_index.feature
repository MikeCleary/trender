Feature: User index
  Background: 
    Given the visitor is on the map page

  Scenario: A member views and pages through readers
    Given there are 15 readers in the database
    And the member navigates to "View all readers"
    Then they should see 10 "reader"
    And when they navigate to the next page
    Then they should see 5 "reader"