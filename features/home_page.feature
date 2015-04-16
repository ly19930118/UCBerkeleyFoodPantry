Feature: make sure the new layout of the home page is styled correctly

  As a curious browser
  When I first go on the UC Berkeley Food Pantry homepage
  I want to see a nav bar with proper links with an image background and the name of the site along with properly styled design.

  Background: The new tabs template has been set up

  Given I am on the UCBerkeleyFoodPantry home page

  Scenario: homepage should have navbar
    Then I should see an element ".navbar"

  Scenario: homepage should have title of app
    I should see "UC Berkeley Food Pantry"

  Scenario: homepage should have logo
    Then I should see an element ".food-pantry-logo"

  Scenario: the navbar should have links to all the different pages
    Then I should see links to "Home"
    And I should see links to "Resources"
    And I should see links to "Events"
    And I should see links to "Inventory"
    And I should see links to "Contact"
    And I should see links to "Help Us"
  
  Scenario: go to about page
    When I follow "About"
    Then I should be on the "About Page"

  Scenario: go to resources page
    When I follow "Resources"
    Then I should be on the "Resources Page"
    And I should see links to "Resources"

  Scenario: go to inventory page
    When I follow "Inventory"
    Then I should be on the "Inventory Page"

  Scenario: go to events page
    When I follow "Events"
    Then I should be on the "Events Page"
