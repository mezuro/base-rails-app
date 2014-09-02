Feature: Project Deletion
  In order to be able to remove repositories
  As a regular user
  The system should have an interface to it

  @kalibro_restart @kalibro_processor_restart
  Scenario: Should delete a project that I own
    Given I am a regular user
    And I am signed in
    And I own a sample project
    And I have a sample configuration with native metrics
    And I have a sample repository within the sample project named "QtCalculator"
    And I start to process that repository
    And I wait up for a ready processing
    When I visit the repository show page
    And I click the Destroy link
    Then I should see "There are no Repositories yet!"