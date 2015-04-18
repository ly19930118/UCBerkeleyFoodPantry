Feature: make sure the partners page is set up and displays proper information

	As a person who is curious as to who the partners for this food pantry are,
	When I go to the Partners Page for the UC Berkeley Food Pantry Website,
	I want to see a list of all the partners for the food pantry.

	Background: The new tabs template has been set up
  
  Given I am on the UCBerkeleFoodPantry home page
  
  Scenario: partners page should have list of partners for food pantry
    When I follow "Partners"
    Then I should be on the "Partners Page"
    And I should see "ASUC"
    And I should see "Executive Vice President"
    And I should see "Public Service Center"
    And I should see "Centers for Educational Equity & Excellence (CE3)"
    And I should see "Division of Student Affairs"
    And I should see "Division of Equity & Inclusion"
    And I should see "Financial Aid & Scholarships Office"
    And I should see "UC Student Regent"
    And I should see "University Health Services"
    And I should see "University Village"

