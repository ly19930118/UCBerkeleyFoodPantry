Feature: Inventory page is properly defined

  As an UC Berkeley Food Pantry user,
  I want to able to submit an item through the inventory form, 
  So that I can get the item I want.

  Background: The new tabs template has been set up
  
  Given the following inventory items exists:
    | item               | quantity          | maximum  |
    | granola            | 10                | 2        |
    | cereal             | 20                | 1        |
    | cookies            | 8                 | 2        |
    | carrots            | 1                 | 2        |

  And the following users exists:
    | userid             | orders_this_month | password | admin
    | cheezit            | 0                 | pass123  | false
    | greedy             | 2                 | pass321  | false

  And I am on the UCBerkeleyFoodPantry home page

  Scenario: go to inventory page
    When I follow "Inventory"
    Then I should be on the "Inventory Page"
    And I should see "Inventory Form"
    And I should see a field "email"
    And I should see "granola"
    And I should see "cereal"
    And I should see "cookies"
    
  Scenario: set how many food items you want and submit the form successfully
  	Given I am logged in as user cheezit
  	And I am on the Inventory Page
  	When I fill in "cookies_box" with "2"
  	And I fill in "granola_box" with "1"
  	And I click the "Submit" button
  	Then I should be on the UCBerkeleyFoodPantry home page
  	And I should see "Your order was processed successfully! Thank you!"

  Scenario: after form submit quantity for foods update correctly
    Given I am logged in as user cheezit
    And I am on the Inventory Page
    When I fill in "cookies_box" with "2"
    And I fill in "granola_box" with "1"
    And I click the "Submit" button
    Then I should be on the UCBerkeleyFoodPantry home page
    And I should see "Your order was processed successfully! Thank you!"
    And I follow "Inventory"
    Then I shoould see "cookies, quantity: 6"
    And I should see "granola, quantity: 9"
  	
  Scenario: accidentally filled in textbox with invalid entry should get error message
  	Given I am logged in as user cheezit
  	And I am on the Inventory Page
  	When I fill in "cookies_box" with "a"
  	And I click the "Submit" button
  	Then I should be on the Inventory Page
  	And I should see "Invalid entry! Check that you only put in numbers!"
  
  Scenario: try to order more than maximum number of a food item
  	Given I am logged in as user cheezit
  	And I am on the Inventory Page
  	When I fill in "cookies_box" with "8"
  	And I click the "Submit" button
  	Then I should be on the Inventory Page
  	And I should see "Can't order more than the maximum number of the food"

  Scenario: try to order more than current quantity
    Given I am logged in as user cheezit
    And I am on the Inventory Page
    When I fill in "carrots_box" with "2"
    And I click the "Submit" button
    Then I should see "Sorry, there aren't that many in stock!"
  	
  Scenario: if you ordered twice in one month already, can't order more
  	Given I am logged in as user greedy
  	And I am on the Inventory Page
  	When I fill in "cookies_box" with "1"
  	And I click the "submit" button
  	Then I should be on the UCBerkeleyFoodPantry home page
  	And I should see "Sorry! You can only order twice a month!"
  

  
  

