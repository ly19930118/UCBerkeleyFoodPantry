Feature: make sure you can see the contact information on the page

  As a curious browser
  So that I find out how to contact the UC Berkeley Food Pantry
  I want to see contact information on the contact page

  Background: The new tabs template has been set up
  Given I am on the UCBerkeleyFoodPantry home page

  Scenario: see contact information
    I should see the page with link "Send Us An Email!" to "mailto:fill me out!"
    And I should see the page with link "Facebook Link" to "fill me out!"
    And I should see "Location: fill me out!"
    And I should see "Hours for Spring 2015 fill me out!"
