Feature: make sure Resources Page works correctly

  As a UC Berkeley Pantry user
  So that I can find additional resources
  I want to see links to resources

  Background: Resources Page has been set up

  Scenario: go to the resources page
    Given I am on the "Resources Page"
    Then I should see the page with link "http://financialaid.berkeley.edu/food-resources" to "http://financialaid.berkeley.edu/food-resources"
