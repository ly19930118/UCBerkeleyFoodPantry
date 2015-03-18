Feature: Ability to create account as a user

  As a UC Berkeley Food Pantry user,
  I want to able to create an account,
  So that I can begin placing orders for food.

  Background:

  Given I am on the UCBerkeleyFoodPantry Login page

  Scenario: create account as a user successfully
    When I follow "Create Account"
    Then I should be on the Create Account page
    And I check the option "Create Account as User"
    Then I should be on the Create User Account page
    Then I should see a field "username"
    And I should see a field "password"
    When I fill in the "username" field with "fakeUser"
    And I fill in the "password" field with "fakePassWord"
    And I press "Submit"
    Then I should be on the Login page
    And I should see "Account Successfully Created"

  Scenario: create account as a user unsuccessfully with a taken username
    When I follow "Create Account"
    Then I should be on the Create Account page
    And I check the option "Create Account as User"
    Then I should be on the Create User Account page
    Then I should see a field "username"
    And I should see a field "password"
    When I fill in the "username" field with "takenUser"
    And I fill in the "password" field with "takenPassWord"
    And I press "Submit"
    Then I should be on the Create User Account page
    And I should see "Error: username already taken, please choose another."
