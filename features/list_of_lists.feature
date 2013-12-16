Feature: Reading lists
  Background: 
    Given the visitor is on the map page
  
  Scenario: A member views and pages through reading lists
    Given there are 15 reading lists in the database
    And the member navigates to "View all lists"
    Then they should see 10 "reading_list"
    And when they navigate to the next page
    Then they should see 5 "reading_list"


