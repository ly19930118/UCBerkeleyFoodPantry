Feature: make sure the login page is properly styled and working

  As a browser
  When I am on the UC Berkeley Food Pantry Login Page
  I want to be able to login and access my account

  Background: The new tabs template has been set up

  Given the following users exists:
  | userid                  | orders_this_month | password | admin |
  | cheezit                 | 0                 | pass123  | False |
  | admin1                  | 0                 | pass456  | True  |
  And I am on the login page

  Scenario: I should be able to access my account if I have valid user and pass
    When I fill out the form with the following attributes:
      | user     | cheezit |
      | password | pass123 |
    And I click the Login button
    Then I should see "Login Successful"

  Scenario: I should not be able to login with invalid info
    When I fill out the form with the following attributes:
      | user     | fakeuser |
      | password | pass123  |
    And I click the Login button
    Then I should see "Wrong password or username."

  Scenario: I should be able to verify that I have succesfully logged in as admin
    When I fill out the form with the following attributes:
      | user     | admin1   |
      | password | pass456  |
    And I click the Login button
    Then I should see "Login as admin succesful."