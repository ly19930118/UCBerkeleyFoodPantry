Feature: User Permission should be properly handled
  As a user, I should not be able to edit inventory, edit calendar events and edit hours So that I don't change the website's information.

  Background:

  Given I am logged in as user

  Scenario: user should not be able to edit inventory
    Given I am on the Inventory Page
    Then I should not see "Edit Inventory" button
  
  Scenario: user should not see add new event on Calendar Page
  	Given I am on the Events page 
  	Then I should not see the "Add New Event" button

  Scenario: user should not be able to edit hours on About page
  	Given I am on the About page
  	Then I should not see the "Edit Hours" button


