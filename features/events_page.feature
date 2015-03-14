Feature: events page is properly defined

  As an UC Berkeley Food Pantry user,
  I want to see the calendar on the events page, 
  So that I can discover what events are available.

  Background: The new tabs template has been set up

  Given I am on the UCBerkeleyFoodPantry home page

  Scenario: go to events page
    When I follow "Events"
    Then I should be on the "Events Page"
    #Then I should see "my new event"
    Then I should see the element "calendar"