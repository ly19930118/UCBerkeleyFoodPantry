Feature: give admin certain privileges

  As a admin to the UCB Food Pantry
  So that I can update the website with new information
  I want to be able to update inventory, hours, and events

  Background: The new tabs template has been set up

  Given I am on the UCBerkeleyFoodPantry home page
  And I am logged into the admin panel

  Scenario: update inventory
    When I follow "Inventory"
    I should be on the "Inventory Page"
    And I should see "Update Inventory"
    When I follow "Update Inventory"
    Then I should be on the "Updating Inventory Page"
    When I fill in "item" with "food item"
    And I fill in "amount" with "food amount"
    And I follow "update"
    Then I should see "successfully updated"
    And I should see "food item" with "food amount"
    
  Scenario: update hours
    I should see "Update Hours"
    When I follow "Update Hours"
    I should be on the "Updating Hours Page"
    When I fill in "semester" with "semester"
    And I fill in "day" with "time"
    And I follow "update"
    Then I should see "successfully updated"
    And I should see "Hours for semester" with "time for day"

  Scenario: update events
    When I follow "Events"
    I should be on the "Events Page"
    And I should see "Update Calendar"
    When I follow "Update Calendar"
    I should be on the "Updating Calendar Page"
    When I fill in "date" with "event date"
    And I fill in "what event" with "event"
    And I follow "update"
    Then I should see "successfully updated"
    And I should see "event" on the calendar



