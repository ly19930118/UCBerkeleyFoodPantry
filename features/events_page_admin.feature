Feature: admins should have the ability to edit events

  As an admin to the UC Berkeley Food Pantry website,
  So that I can inform students on upcoming events that might interest them,
  I want to be able to edit the events on the calendar on the Events Page

Background: The new tabs template has been set up
  Given I am on the UCBerkeleyFoodPantry Login page
  Given the following admin users exists:
    | userid             | orders_this_month | password |
    | cheezit            | 0                 | pass123  |

  Scenario: as an admin, be able to see and create events

    And I am on the login page

    When I fill out the form with the following attributes:
      | session_userid     | cheezit |
      | session_password   | pass123 |
    And I click the "Log in" button
    Then I should be on the UCBerkeleyFoodPantry home page

    Given I am on the home page
    When I follow "Events"
    Then I should see "Event Form"
    When I fill in "event_title" with "yoyo"
    And I fill in "event_description" with "thx"
    When I click the "Submit" button
    And I should see "yoyo"
    And I should see "thx"
  Scenario: edit an event

    And I am on the login page

    When I fill out the form with the following attributes:
      | session_userid     | cheezit |
      | session_password   | pass123 |
    And I click the "Log in" button
    Then I should be on the UCBerkeleyFoodPantry home page
    Given I am on the home page
    When I follow "Events"

    When I fill in "event_title" with "yoyo"
    And I fill in "event_description" with "thx"
    When I click the "Submit" button


    When I click the "edit_yoyo" button
    Then I fill in "event_title" with "hi"
    And I fill in "event_description" with "hi2"
    And I click the "Submit" button
    And I should see "hi"
    And I should see "hi2"
    And I should not see "yoyo"
  
  Scenario: delete an event
    And I am on the login page

    When I fill out the form with the following attributes:
      | session_userid     | cheezit |
      | session_password   | pass123 |
    And I click the "Log in" button
    Then I should be on the UCBerkeleyFoodPantry home page
    Given I am on the home page
    When I follow "Events"

    When I fill in "event_title" with "hey"
    And I fill in "event_description" with "heyman"
    When I click the "Submit" button

    When I click the "delete_hey" button
    And I should not see "heyman"
