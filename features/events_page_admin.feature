Feature: admins should have the ability to edit events

  As an admin to the UC Berkeley Food Pantry website,
  So that I can inform students on upcoming events that might interest them,
  I want to be able to edit the events on the calendar on the Events Page

Background: The new tabs template has been set up

  Given the following events exist:
  | title      | start_date | end_date    | description                        |
  | hello      | 04-01-2015 | 04-01-2015  | can we edit and delete this event? |

  Scenario: as an admin, be able to see and create events
    Given I am on the Events Page
    Then I should see "Event Form"
    When I fill in "Title" with "title"
    And I fill in "Description" with "description"
    When I click the "Submit" button
    Then I should be on the Events Page
    And I should see "title"
    And I should see "description"

  Scenario: edit an event
    Given I am on the Events Page
    When I click the "edit_0" button
    Then I fill in "Title" with "hi"
    And I fill in "Description" with "hi2"
    And I click the "Submit" button
    Then I should be on the Events Page
    And I should see "hi"
    And I should see "hi2"
    And I should not see "hello"

  Scenario: delete an event
    Given I am on the Events Page
    When I click the "delete_0" button
    Then I should be on the Events Page
    And I should not see "hello"

