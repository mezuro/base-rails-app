Feature: New reading
  In order to be able to create new readings
  As a metric specialist
  I should be able to fill up a form with its informations and submit it

  Background: Regular user and signed in
    Given I am a regular user
    And I am signed in

  @kalibro_restart
  Scenario: Visiting reading creation page
    And I own a sample reading group
    And I visit the Sample Reading Group page
    When I click the New Reading link
    Then I should be at the New Reading page
    And I should see "Label"
    And I should see "Grade"
    And I should see "Color"
    And I press the Pick color button

  @kalibro_restart
  Scenario: With valid fields
    And I own a sample reading group
    And I am at the New Reading page
    And I fill the Label field with "My Reading"
    And I fill the Grade field with "1"
    And I fill the Color field with "00000ff00"
    When I press the Save button
    Then I should be in the Sample Reading Group page

  @kalibro_restart @javascript
  Scenario: Checking color picker existence
    And I own a sample reading group
    And I am at the New Reading page
    When I press the Pick color button
    Then I should see a color picker Canvas

  @kalibro_restart @javascript
  Scenario: Selecting a valid color with color picker
    And I own a sample reading group
    And I am at the New Reading page
    And I fill the Label field with "My Reading"
    And I fill the Grade field with "1"
    When I press the Pick color button
    And I click on the center of the color picker
    And I press the Save button
    Then I should be in the Sample Reading Group page

  @kalibro_restart
  Scenario: With an existing label (Label uniqueness test)
    And I own a sample reading group
    And I have a sample reading within the sample reading group labeled "My Reading"
    And I am at the New Reading page
    And I fill the Label field with "My Reading"
    And I fill the Grade field with "1"
    And I fill the Color field with "00000ff00"
    When I press the Save button
    Then I should see "1 error prohibited this Reading from being saved"
    And I should be at the New Reading page

  @kalibro_restart
  Scenario: With an invalid grade and invalid color
    And I own a sample reading group
    And I am at the New Reading page
    And I fill the Label field with "My Reading"
    And I fill the Grade field with "z"
    And I fill the Color field with "00000ff00"
    When I press the Save button
    Then I should see "Grade is not a number"
    And I should be at the New Reading page
    And I fill the Label field with "My Reading"
    And I fill the Grade field with "1"
    And I fill the Color field with "z"
    When I press the Save button
    Then I should see "1 error prohibited this Reading from being saved"
    And I should be at the New Reading page


