Feature: Admins can properly edit Inventory page

	As an UC Berkeley Food Pantry admin,
	I want to be able to add, edit, and delete food items,
	So that I can correctly update the food inventory.

	Background: The new tabs template has been set up

	Given the following inventory items exists:
	  | item               | quantity          | maximum  |
	  | granola            | 10                | 2        |
	  | cereal             | 20                | 1        |
  	| cookies            | 8                 | 2        |

  And the following users exists:
    | userid             | orders_this_month | password | admin |
    | cheezit            | 0                 | pass123  | true  |

  And I am on the Inventory Page

  Scenario: Edit existing food item
    When I follow "granola"
    Then I should be on the details page for "granola"
   	When I fill in "quantity" with "5"
   	And I fill in "maximum" with "3"
   	And I click the "Update Info" button
   	Then I should be on the "Inventory Page"
   	And I should see "granola, quantity: 10, maximum: 2"

  Scenario: Delete existing food item
   	When I follow "cereal"
   	Then I should be on the details page for "granola"
   	When I click the "delete" button
   	Then I should be on the "Inventory Page"
   	And I should not see "cereal, quantity: 20, maximum: 1"

  Scenario: Add new food item
   	When I click the "add new item" button
   	Then I should be on a "new item" page
   	When I fill in "item" with "pasta noddles"
   	And I fill in "quantity" with "20"
   	And I fill in "maximum" with "1"
   	And I click the "submit" button
   	Then I should be on the "Inventory Page"
   	And I should see "pasta noodles, quantity: 20, maximum 1"
