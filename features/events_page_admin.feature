Feature: admins should have the ability to edit events

  As an admin to the UC Berkeley Food Pantry website,
  So that I can inform students on upcoming events that might interest them,
  I want to be able to edit the events on the calendar on the Events Page

Background: The new tabs template has been set up

  Given the following event exists:
  | title      | date     | description                        |
  | Test Event | 04-01-15 | can we edit and delete this event? |

  Scenario: as an admin, be able to see and create events
    Given I am on the Events Page
    I should see "Create Event"
    When I fill in "Title of Event" with "title"
    And I fill in "Date" with "date"
    And I fill in "Description" with "description"
    When I press "Create Event"
    Then I should be on the Events Page
    And I should see "title"
    When I follow "title"
    Then I should be on the Information Page for "title"
    And I should see "description"

  Scenario: edit an event
    Given I am on the Events Page
    When I follow "Test Event"
    I should be on the Information Page for "Test Event"
    And I should see "Edit Event"
    When I fill in "Title of Event" with "new title"
    And I fill in "Date" with "new date"
    And I fill in "Description" with "new description"
    And I press "Edit Event"
    Then I should be on the Events Page
    And I should see "new title"
    When I follow "new title"
    Then I should see "new description"

  Scenario: delete an event
    Given I am on the Information Page for "new title"
    When I press "Delete Event"
    Then I should be on the Events Page
    And I should not see "new title"

