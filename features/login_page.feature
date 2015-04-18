Feature: make sure the login page is properly styled and working

As a user or an admin,
So that I can use the UC Berkeley Food Pantry website,
I want to be able to login to my account

Background: I have already created an account

  Given the following users exists:

  | userid             | orders_this_month | password |
  | cheezit           | 0                 | pass123  |

    And I am on the login page

  Scenario: I should be able to access my account
if I have valid user and pass as a user
    When I fill out the form with the following attributes:
      | session_userid     | cheezit |
      | session_password   | pass123 |
    And I click the "Log in" button
    Then I should be on the UCBerkeleyFoodPantry home page
    And I should see "Logout"

  Scenario: I should not be able to login with invalid info
    When I fill out the form with the following attributes:
      | session_userid     | fakeuser |
      | session_password   | pass123  |
    And I click the "Log in" button
    Then I should see "Invalid user/password combination"
