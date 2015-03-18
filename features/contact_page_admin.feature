Feature: admins should have the ability to edit contact information

  As an admin to the UC Berkeley Food Pantry website,
  So that I can let students know what days and times we are open,
  I want to be able to edit the hours on the Contact Page

Background: The new tabs template has been set up

  Given I am on the "Contact Page"

  Scenario: as an admin, be able to edit hours
    I should see "Edit Contact Information"
    When I follow "Edit Contact Information"
    I should be on the "Edit Contacts Page"
    When I fill in "Email" with "new email"
    And I fill in "Facebook" with "new facebook"
    And I fill in "Location" with "new location"
    And I fill in "Hours" with "new hours"
    And I press "Update"
    Then I should be on the "Contact Page"
    And I should see "new email"
    And I should see "new facebook"
    And I should see "new location"
    And I should see "new hours"
