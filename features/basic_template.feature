Feature: make sure the new layout of the website works correctly

  As a curious browser
  So that I can discover what the UC Berkeley Food Pantry does
  I want to see an about tab, a resources tab, an inventory tab, and an event tab

  Background: The new tabs template has been set up

  Given I am on the UCBerkeleyFoodPantry home page

  Scenario: go to about page
    When I follow "About"
    Then I should be on the "About Page"

  Scenario: go to resources page
    When I follow "Resources"
    Then I be on the "Resources Page"
    And I should see links to resources

  Scenario: go to inventory page
    When I follow "Inventory"
    Then I should be on the "Inventory Page"

  Scenario: go to events page
    When I follow "Events"
    Then I should be on the "Events Page"