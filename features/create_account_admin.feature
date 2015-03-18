Feature: Ability to create account as an admin

  As a member of UC Berkeley Food Pantry,
  I want to able to create an account,
  So that I can update information on the .

  Background:

  Given I am on the UCBerkeleyFoodPantry Login page

  Scenario: create account as an admin with correct admin key
    When I follow "Create Account"
    Then I should be on the "Create Account"
    And I check the option "Create Account as Admin"
    Then I should see a field "Admin Key"
    When I fill in a "correct admin key"
    Then I should see a field "email"

  Scenario: create account as an admin with incorrect admin key
    When I follow "Create Account"
    Then I should be on the "Create Account"
    And I check the option "Create Account as Admin"
    Then I should see a field "Admin Key"
    When I fill in a "correct admin key"
    Then I should see a field "email"