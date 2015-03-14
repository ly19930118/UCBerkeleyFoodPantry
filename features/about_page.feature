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
    And I should see a "Location" section
    And I should see an "Hours" section