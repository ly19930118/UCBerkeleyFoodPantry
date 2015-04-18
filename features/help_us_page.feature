Feature: make sure the Help Page is correctly implemented

	As a user of UCBerkeleyFoodPantry
	So that I can help the FoodPantry organization
	I want to see the information to donate and volunteer

Background: The new tabs template has been set up

Given I am on the UCBerkeleyFoodPantry home page

Scenario: see the Volunteer information
	When I follow "Help Us"
	Then I should be on the "Help Page"
	And I should see "The UC Berkeley Food Pantry is run by volunteers from the UC Berkeley community and its supporters. Volunteers help with food collection, distribution, fundraising, and administrative tasks."
	And I should see "If you are interested in volunteering, please email us at ucberkeleyfoodpantry@gmail.com"

Scenario: donate to UCBerkeleyFoodPantry
	When I follow "Help Us"
	Then I should be on the "Help Page"
	And I should see the page with link "donating" to "https://givetocal.berkeley.edu/fund/?f=FU1229000"

	
