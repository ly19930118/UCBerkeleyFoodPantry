Feature: make sure Resources Page works correctly

  As a UC Berkeley Pantry user
  So that I can find additional resources
  I want to see links to resources

  Background: Resources Page has been set up

  Scenario: go to the resources page
    Given I am on the "Resources Page"
    Then I should see the page with link "cs169" to "https://sites.google.com/site/ucbsaas/"
    Then I should see the page with link "old website" to "http://pantry.asuc.org/"
    And I should see "Resource1"
    And I should see "Resource2"
    And I should see "Resource3" 