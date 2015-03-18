Feature: make sure the login page is properly styled and working

  As a user or an admin,
  So that I can use the UC Berkeley Food Pantry website,
  I want to be able to login to my account

  Background: I have already created an account

  Given the following users exists:

  | userid                  | orders_this_month | password | admin |
  | cheezit                 | 0                 | pass123  | False |
  | admin1                  | 0                 | pass456  | True  |

    And I am on the login page

  Scenario: I should be able to access my account if I have valid user and pass as a user
    When I fill out the form with the following attributes:
      | user     | cheezit |
      | password | pass123 |
    And I click the Login button
    Then I should be on the UCBerkeleyFoodPantry home page
    And I should see "User Login Successful"

  Scenario: I should not be able to login with invalid info
    When I fill out the form with the following attributes:
      | user     | fakeuser |
      | password | pass123  |
    And I click the Login button
    Then I should see "Wrong password or username."

  Scenario: I should be able to verify that I have successfully logged in as an admin
    When I fill out the form with the following attributes:
      | user     | admin1   |
      | password | pass456  |
    And I click the Login button
    Then I should be on the UCBerkeleyFoodPantry home page
    And I should see "Admin Login Successful"