Feature: Admins can properly edit Inventory page

	As an UC Berkeley Food Pantry admin,
	I want to be able to add, edit, and delete food items,
	So that I can correctly update the food inventory.

	Background: The new tabs template has been set up

	Given the following inventory items exists:
	  | name               | quantity          | maximum  |
	  | granola            | 10                | 2        |
	  | cereal             | 20                | 1        |
  	| cookies            | 8                 | 2        |
    | hello              | 1                 | 2        |
    | yoyomaa            | 1                 | 2        |
    | yohihih            | 1                 | 2        |
    | lolllll            | 1                 | 2        |
    | yoooooo            | 1                 | 2        |

  And the following admin users exists:
    | userid             | orders_this_month | password | admin |
    | cheezit            | 0                 | pass123  | true  |

  And I am on the Inventory Page

  Scenario: Edit existing food item
    And I am on the login page

    When I fill out the form with the following attributes:
      | session_userid     | cheezit |
      | session_password   | pass123 |
    And I click the "Log in" button
    Then I should be on the UCBerkeleyFoodPantry home page
    When I follow "Inventory"

    When I click the "edit_cookies" button
    Then I fill in "inventory_item_name" with "newcook"
    Then I click the "Submit" button
    And I should see "newcook"
   	And I should not see "cookies"

  Scenario: Delete existing food item
    And I am on the login page

    When I fill out the form with the following attributes:
      | session_userid     | cheezit |
      | session_password   | pass123 |
    And I click the "Log in" button
    Then I should be on the UCBerkeleyFoodPantry home page
    When I follow "Inventory"

    When I click the "delete_yoyomaa" button
    Then I should not see "edit_yoyomaa"

  Scenario: Add new food item

    And I am on the login page

    When I fill out the form with the following attributes:
      | session_userid     | cheezit |
      | session_password   | pass123 |
    And I click the "Log in" button
    Then I should be on the UCBerkeleyFoodPantry home page
    When I follow "Inventory"

    When I fill in "inventory_item_name" with "hellotesting"
    When I fill in "inventory_item_stock" with "3"
    When I fill in "inventory_item_max_per_order" with "2"
    And I click the "Submit" button
    Then I should see "hellotesting"
