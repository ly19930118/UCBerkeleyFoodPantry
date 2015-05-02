Feature: Inventory page is properly defined

  As an UC Berkeley Food Pantry user,
  I want to able to submit what food items I want through the inventory form and be told what items I can't order, 
  So that I can get the items I want.

  Background: The new tabs template has been set up
  
  Given the following inventory items exists:
    | name               | quantity          | maximum  |
    | granola            | 10                | 2        |
    | cereal             | 20                | 1        |
    | cookies            | 8                 | 2        |
    | carrots            | 1                 | 2        |
    | hello              | 1                 | 2        |
    | yoyomaa            | 1                 | 2        |
    | yohihih            | 1                 | 2        |
    | lolllll            | 1                 | 2        |
    | yoooooo            | 1                 | 2        |

  And the following non admin users exists:
    | userid             | orders_this_month | password |
    | cheezit            | 0                 | pass123  |
    | greedy             | 2                 | pass321  |

  And I am on the UCBerkeleyFoodPantry home page

  Scenario: go to inventory page
    When I follow "Inventory"
    Then I should be on the "Inventory Page"    
    And I should see "granola"
    And I should see "cereal"
    And I should see "cookies"
    
  Scenario: set how many food items you want and submit the form successfully
  	And I am on the login page

    When I fill out the form with the following attributes:
      | session_userid     | cheezit |
      | session_password   | pass123 |
    And I click the "Log in" button
    Then I should be on the UCBerkeleyFoodPantry home page
    When I follow "Inventory"
    When I check "items_cookies_checked"
  	And I check "items_cereal_checked"
  	And I check "items_granola_checked"
  	And I click the "Submit Request" button
    Then I should be on the "Survey Page"
  	And I should see "Your order was processed successfully!"

  Scenario: try to order more than maximum number of a food item
    And I am on the login page

    When I fill out the form with the following attributes:
      | session_userid     | cheezit |
      | session_password   | pass123 |
    And I click the "Log in" button
    Then I should be on the UCBerkeleyFoodPantry home page
    When I follow "Inventory"

    When I check "items_carrots_checked"
    When I check "items_hello_checked"
    When I check "items_yoyomaa_checked"
    When I check "items_yoooooo_checked"
    When I check "items_cookies_checked"
    When I check "items_cereal_checked"

    And I click the "Submit Request" button
    And I should see "You can only have 4 items total"

