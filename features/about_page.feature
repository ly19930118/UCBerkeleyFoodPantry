Feature: make sure the about page is set up correctly

	As a curious browser,
	When I go to the About Page for the UC Berkeley Food Pantry Website,
	I want to see information about the Food Pantry.
  
  Given I am on the UCBerkeleFoodPantry home page
  
  Scenario: about page should have About Us information, Mission statement, and Goals
    When I follow "About"
    Then I should be on the "About Page"
    And I should see an "About Us" section
    And I should see a "Mission Statement" section
    And I should see a "Goals" section
