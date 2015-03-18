Feature: Ability to create account as an admin

  As a member of UC Berkeley Food Pantry,
  So that I can update information on the website,
  I want to able to create an account.

  Background:

  Given I am on the UCBerkeleyFoodPantry Login page

  Scenario: create account as an admin with correct admin key
    When I follow "Create Account"
    Then I should be on the Create Account page
    And I follow "Create Account as Admin"
    Then I should see a field "Admin Key"
    When I fill in the correct admin key
    Then I should be on the Create Admin Account page
    And I should see a field "username"
    And I should see a field "password"
    When I fill out the form with the following attributes:
      | username | fakeAdmin |
      | password | pass123   |
    And I click the "Submit" button
    Then I should be on the UCBerkeleyFoodPantry home page
    And I should see "Admin Account Successfully Created"

  Scenario: create account as an admin with incorrect admin key
    When I follow "Create Account"
    Then I should be on the Create Account page
    And I follow "Create Account as Admin"
    Then I should see a field "Admin Key"
    When I fill in the incorrect admin key
    Then I should be on the Create Account page
    And I should see "Error: Incorrect Admin Key"