Feature: admins should have the ability to edit contact information

  As an admin to the UC Berkeley Food Pantry website,
  So that I can let students know what days and times we are open,
  I want to be able to edit the hours on the Contact Page

Background: The new tabs template has been set up

  Given the following users exists:
    | userid             | orders_this_month | password |
    | cheezit            | 0                 | pass123  |

    And I am on the login page

  Scenario: as an admin, be able to edit hours
      When I fill out the form with the following attributes:
        | session_userid     | cheezit |
        | session_password   | pass123 |
    And I click the "Log in" button
    Then I should be on the UCBerkeleyFoodPantry home page
    And I should see "Edit Contact Info" button
    When I click the "Edit Contact Info" button
    Then I should be on the "Edit Contact Page"
    When I fill in "Email:" with "new email"
    And I fill in "Facebook:" with "new facebook"
    And I fill in "Location:" with "new location"
    And I fill in "Hours:" with "new hours"
    And I click the "Update Contact Info" button
    Then I should see the page with link "Send Us An Email!" to "mailto:new email"
    And I should see the page with link "Facebook Link" to "new facebook"
    And I should see "new location"
    And I should see "new hours"
