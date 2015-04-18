Feature: Ability to create account as a user

  As a UC Berkeley Food Pantry user,
  So that I can begin placing orders for food,
  I want to able to create a unique account.

  Background:

  Given I am on the UCBerkeleyFoodPantry Login page

    And the following user exists:
      | userid                  | orders_this_month | password |
      | takenUser               | 0                 | pass123  |

  Scenario: create account as a user successfully
    When I follow "Sign up now!"
    Then I should be on the Signup page
    And I should see a field "user_userid"
    And I should see a field "user_password"
    And I should see a field "user_password_confirmation"
    When I fill out the form with the following attributes:
      | user_userid   | fakeUser |
      | user_password | pass123  |
      | user_password | pass123  |
    And I click the "Create my account" button
    Then I should be on the UCBerkeleyFoodPantry home page
    And I should see "Logout"

  Scenario: unable to create new account with a taken username
    When I follow "Sign up now!"
    Then I should be on the Signup page
    And I should see a field "user_userid"
    And I should see a field "user_password"
    And I should see a field "user_password_confirmation"
    When I fill out the form with the following attributes:
      | user_userid   | takenUser |
      | user_password | pass123   |
      | user_password | pass123   |
    And I click the "Create my account" button
    Then I should be on the Signup page
    And I should see "Userid has already been taken"


  Scenario: unable to create new account with an incorrect password confirmation
    When I follow "Sign up now!"
    Then I should be on the Signup page
    And I should see a field "user_userid"
    And I should see a field "user_password"
    And I should see a field "user_password_confirmation"
    When I fill out the form with the following attributes:
      | user_userid   | fakeUser  |
      | user_password | pass123   |
      | user_password | pass1234  |
    And I click the "Create my account" button
    Then I should be on the Signup page
    And I should see "Password confirmation doesn't match Password"

  Scenario: unable to create new account with an insecure password
    When I follow "Sign up now!"
    Then I should be on the Signup page
    And I should see a field "user_userid"
    And I should see a field "user_password"
    And I should see a field "user_password_confirmation"
    When I fill out the form with the following attributes:
      | user_userid   | fakeUser |
      | user_password | p        |
      | user_password | p        |
    And I click the "Create my account" button
    Then I should be on the Signup page
    And I should see "Password is too short (minimum is 6 characters)"