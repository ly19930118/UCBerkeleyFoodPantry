Feature: make sure you can see the contact information on the page

  As a curious browser
  So that I find out how to contact the UC Berkeley Food Pantry
  I want to see contact information on the contact page

  Background: The new tabs template has been set up

  Given the following contact information exists:
  | email          | facebook          | location |hours         |
  | food@gmail.com | facebook.com/food | Berkeley | Mondays: 3PM |

  Scenario: see contact information
    I should see the page with link "Send Us An Email!" to "mailto:food@gmail.com"
    And I should see the page with link "Facebook Link" to "facebook.com/food"
    And I should see "Location: Berkeley"
    And I should see "Hours for Spring 2015"
