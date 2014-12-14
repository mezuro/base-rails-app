Feature: Show Project
  In order to know all the repositories of the given project and its contents
  As a regular user
  I should be able to see each of them

  Background: Regular user and signed in
    Given I am a regular user

  @kalibro_restart @kalibro_processor_restart
  Scenario: Should not show the create repository link to user that doesn't own the project
    And I have a sample project
    And I have a sample project_image
    And I have a sample configuration with native metrics
    And I have a sample repository within the sample project
    When I am at the Sample Project page
    Then I should not see "New Repository"
    And I should not see "Destroy project"
    And I should not see Edit within table

  @kalibro_processor_restart
  Scenario: Should show the create repository link the project owner
    And I am signed in
    And I own a sample project
    And I have a sample project_image
    When I am at the Sample Project page
    Then I should see "New Repository"

  @kalibro_processor_restart
  Scenario: Considering the project has no repositories
    And I am signed in
    Given I have a sample project
    And I have a sample project_image
    When I am at the Sample Project page
    Then I should see "There are no Repositories yet!"

  @kalibro_restart @kalibro_processor_restart
  Scenario: Considering the project has repositories
    And I am signed in
    Given I have a sample project
    And I have a sample configuration with native metrics
    And I have a sample repository within the sample project
    When I am at the Sample Project page
    Then I should not see "There are no Repositories yet!"

  @kalibro_processor_restart
  Scenario: Checking project contents
    And I am signed in
    Given I have a sample project
    And I have a sample project_image
    When I am at the Sample Project page
    Then the sample project should be there
