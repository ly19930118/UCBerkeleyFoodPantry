Feature: display all the important sections for different pieces of information

  As a hungry student without a lot of money,
  So that I can quickly navigate to and see any information I want to know about the Food Pantry,
  I want to see all the different section titles in tabs on the homepage. 

  Given I am on the FoodPantry home page

Scenario: see all section tabs?


Scenario: see the page with a calendar or listing of all upcoming events
  When I follow "Upcoming Events"
  Then I should be on the events page
  And I should see a calendar
  And I should see "Dummy Event"

Scenario: see the UC Berkeley Food Pantry about page
  When I follow "About Us"
  Then I should be on the about page
  And I should see "about information"

Scenario: see the inventory page with all the current food items in stock
  When I follow "Food Inventory"
  Then I should be on the food page
  And I should see "food information"

Scenario: see the resources page
  When I follow "Other Resources"
  Then I should be on the resources page
  And I should see "other food resources"