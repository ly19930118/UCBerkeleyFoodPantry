Feature: admins should have the ability to edit contact information

  As an admin to the UC Berkeley Food Pantry website,
  So that I can let students know what days and times we are open,
  I want to be able to edit the hours on the Contact Page

Background: The new tabs template has been set up

  Given the following contact page exists:
  | email          | facebook          | location |hours         |
  | food@gmail.com | facebook.com/food | Berkeley | Mondays: 3PM |

  Scenario: as an admin, be able to edit hours
    Given I am on the "Contact Page"
    Then I should see "Edit Contact Info" button
    When I click the "Edit Contact Info" button
    Then I should be on the "Edit Contact Page"
    When I fill in "email" with "new email"
    And I fill in "facebook" with "new facebook"
    And I fill in "location" with "new location"
    And I fill in "hours" with "new hours"
    And I click the "Update Contact Info" button
    Then I should be on the "Contact Page"
    And I should see the page with link "Send Us An Email!" to "mailto:new email"
    And I should see the page with link "Facebook Link" to "new facebook"
    And I should see "new location"
    And I should see "new hours"
