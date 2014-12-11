Feature: Create range
  In order to be able to create new ranges
  As a metric specialist
  I should be able to fill up a form with its informations and submit it

  @kalibro_configuration_restart
  Scenario: Visiting range creation page when the user own an non-empty reading group
    Given I am a regular user
    And I am signed in
    And I own a sample configuration
    And I own a sample reading group
    And I have a sample metric configuration within the given mezuro configuration
    And I have a sample reading within the sample reading group labeled "My Reading"
    And I am at the sample metric configuration page
    When I click the Add Range link
    Then I should be at the New Range page
    And I should see "Beginning"
    And I should see "End"
    And I should see "Comments"
    And I should see "Reading"

  @kalibro_configuration_restart
  Scenario: Visiting range creation page when the user don't own the reading group and this reading group is empty
    Given I am a regular user
    And I am signed in
    And I own a sample configuration
    And I have a reading group named "Scholar"
    And I have a sample metric configuration within the given mezuro configuration
    And I am at the sample metric configuration page
    When I click the Add Range link
    Then I should be at the New Range page
    And I should see "Beginning"
    And I should see "End"
    And I should see "Comments"
    And I should see "You must have Readings within your associated Reading Group to create a new Range."
    And I should see "The Reading Group of your Metric Configuration belongs to another user and you are not allowed to modify it."

  @kalibro_configuration_restart
  Scenario: Visiting range creation page when the user own an empty reading group (testing link to New Reading)
    Given I am a regular user
    And I am signed in
    And I own a sample configuration
    And I own a sample reading group
    And I have a sample metric configuration within the given mezuro configuration
    And I am at the sample metric configuration page
    When I click the Add Range link
    Then I should be at the New Range page
    And I should see "Beginning"
    And I should see "End"
    And I should see "Comments"
    And I should see "You must have Readings within your associated Reading Group to create a new Range."
    When I click the Create New Reading link
    Then I should be at the New Reading page
    And I should see "Label"
    And I should see "Grade"
    And I should see "Color"

  @kalibro_configuration_restart
  Scenario: With valid fields and owning a non-empty reading group
    Given I am a regular user
    And I am signed in
    And I own a sample configuration
    And I own a sample reading group
    And I have a sample metric configuration within the given mezuro configuration
    And I have a sample reading within the sample reading group labeled "My Reading"
    And I am at the New Range page
    And I fill the Beginning field with "42"
    And I fill the End field with "666"
    And I fill the Comments field with "My Comment"
    And I set the select field "Reading" as "My Reading"
    When I press the Save button
    Then I should be at metric configuration sample page

  @kalibro_configuration_restart
  Scenario: With invalid fields and owning a non-empty reading group (Beginning > End)
    Given I am a regular user
    And I am signed in
    And I own a sample configuration
    And I own a sample reading group
    And I have a sample metric configuration within the given mezuro configuration
    And I have a sample reading within the sample reading group labeled "My Reading"
    And I am at the New Range page
    And I fill the Beginning field with "666"
    And I fill the End field with "42"
    And I fill the Comments field with "My Comment"
    And I set the select field "Reading" as "My Reading"
    When I press the Save button
    Then I should be at the New Range page
    And I should see "1 error prohibited this MezuroRange from being saved"
    And I should see "[666.0, 42.0[ is not a valid range"

  @kalibro_configuration_restart
  Scenario: With an invalid beggining (not a number)
    Given I am a regular user
    And I am signed in
    And I own a sample configuration
    And I own a sample reading group
    And I have a sample metric configuration within the given mezuro configuration
    And I have a sample reading within the sample reading group labeled "My Reading"
    And I am at the New Range page
    And I fill the Beginning field with "z"
    And I fill the End field with "42"
    And I fill the Comments field with "My Comment"
    And I set the select field "Reading" as "My Reading"
    When I press the Save button
    Then I should be at the New Range page
    And I should see "1 error prohibited this MezuroRange from being saved"
    And I should see "Beginning is not a number"

  @kalibro_configuration_restart
  Scenario: With an invalid end (not a number)
    Given I am a regular user
    And I am signed in
    And I own a sample configuration
    And I own a sample reading group
    And I have a sample metric configuration within the given mezuro configuration
    And I have a sample reading within the sample reading group labeled "My Reading"
    And I am at the New Range page
    And I fill the Beginning field with "42"
    And I fill the End field with "z"
    And I fill the Comments field with "My Comment"
    And I set the select field "Reading" as "My Reading"
    When I press the Save button
    Then I should see "1 error prohibited this MezuroRange from being saved"
    And I should be at the New Range page

  @kalibro_configuration_restart
  Scenario: With an already taken beginning
    Given I am a regular user
    And I am signed in
    And I own a sample configuration
    And I own a sample reading group
    And I have a sample metric configuration within the given mezuro configuration
    And I have a sample reading within the sample reading group labeled "My Reading"
    And I have a sample range within the sample metric configuration with beginning "2"
    And I am at the New Range page
    And I fill the Beginning field with "2"
    And I fill the End field with "666"
    And I fill the Comments field with "My Comment"
    And I set the select field "Reading" as "My Reading"
    When I press the Save button
    Then I should be at the New Range page
    And I should see "Beginning There is already a MezuroRange with beginning 2.0! Please, choose another one."

  @kalibro_configuration_restart @javascript
  Scenario: Should create range with [-INF, INF] threshold
    Given I am a regular user
    And I am signed in
    And I own a sample configuration
    And I own a sample reading group
    And I have a sample metric configuration within the given mezuro configuration
    And I have a sample reading within the sample reading group labeled "My Reading"
    And I am at the New Range page
    And I click the -∞ link
    And I click the ∞ link
    And I fill the Comments field with "My Comment"
    And I set the select field "Reading" as "My Reading"
    When I press the Save button
    Then I should be at metric configuration sample page
    And I should see "-INF"
    And I should see "INF"

  @kalibro_configuration_restart @javascript
  Scenario: Two valid ranges (one with INF)
    Given I am a regular user
    And I am signed in
    And I own a sample configuration
    And I own a sample reading group
    And I have a sample metric configuration within the given mezuro configuration
    And I have a sample reading within the sample reading group labeled "My Reading"
    And I am at the New Range page
    And I fill the Beginning field with "2"
    And I fill the End field with "666"
    And I fill the Comments field with "My Comment"
    And I set the select field "Reading" as "My Reading"
    And I press the Save button
    And I am at the New Range page
    And I fill the Beginning field with "666"
    And I click the ∞ link
    And I fill the Comments field with "My Comment"
    And I set the select field "Reading" as "My Reading"
    When I press the Save button
    Then I should be at metric configuration sample page
    And I should see "666"
    And I should see "INF"