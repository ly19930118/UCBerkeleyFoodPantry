Feature: make sure there is an about page accessible from the nav bar

  As a curious browser
  So that I can discover what the UC Berkeley Food Pantry does
  I want to read about the Food Pantry in the about page

  Background:

    Given I am on the UCBerkeleyFoodPantry home page

  Scenario: go to about page
    When I follow "About"
    Then I should be on the "About Page"
    And I should see an "About Us" section
    And I should see a "Mission Statement" section
    And I should see a "Goals" section

  Scenario: the navbar should be up top still
    When I follow "About"
    Then I should see links to "Home"
    And I should see links to "About"
    And I should see links to "Resources"
    And I should see links to "Events"
    And I should see links to "Inventory"
    And I should see links to "Partners"
    And I should see links to "Contact"
    And I should see links to "Help Us"
