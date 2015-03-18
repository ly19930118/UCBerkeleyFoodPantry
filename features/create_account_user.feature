Feature: Ability to create account as a user

  As a UC Berkeley Food Pantry user,
  I want to able to create an account,
  So that I can begin placing orders for food.

  Background:

  Given I am on the UCBerkeleyFoodPantry Login page
    And the following user exists:
      | userid                  | orders_this_month | password | admin |
      | takenUser               | 0                 | pass123  | False |

  Scenario: create account as a user successfully
    When I follow "Create Account"
    Then I should be on the Create Account page
    And I follow "Create Account as User"
    Then I should be on the Create User Account page
    And I should see a field "username"
    And I should see a field "password"
    When I fill out the form with the following attributes:
      | username | fakeUser |
      | password | pass123  |
    And I click the "Submit" button
    Then I should be on the UCBerkeleyFoodPantry home page
    And I should see "User Account Successfully Created"

  Scenario: create account as a user unsuccessfully with a taken username
    When I follow "Create Account"
    Then I should be on the Create Account page
    And I follow "Create Account as User"
    Then I should be on the Create User Account page
    Then I should see a field "username"
    And I should see a field "password"
    When I fill out the form with the following attributes:
      | username | takenUser |
      | password | pass123   |
    And I click the "Submit" button
    Then I should be on the Create User Account page
    And I should see "Error: username already taken, please choose another."
