Feature: Inventory page is properly defined

  As an UC Berkeley Food Pantry user,
  I want to able to submit an item through the inventory form, 
  So that I can get the item I want.

  Background: The new tabs template has been set up

  Given I am on the UCBerkeleyFoodPantry home page

  Scenario: go to inventory page
    When I follow "Inventory"
    Then I should be on the "Inventory Page"
    Then I should see "Inventory Form"
    Then I should see a field "email"