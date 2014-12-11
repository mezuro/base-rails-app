Given(/^I have a sample metric configuration within the given mezuro configuration$/) do
  @metric_configuration = FactoryGirl.create(:metric_configuration,
    {id: nil, configuration_id: @kalibro_configuration.id, reading_group_id: @reading_group.id} )
end

Given(/^I have another metric configuration with code "(.*?)" within the given mezuro configuration$/) do |code|
  @another_metric_configuration = FactoryGirl.create(:metric_configuration,
    {id: nil, configuration_id: @kalibro_configuration.id, reading_group_id: @reading_group.id, code: code} )
end

When(/^I visit the sample metric configuration edit page$/) do
  visit edit_kalibro_configuration_metric_configuration_path(@metric_configuration.configuration_id, @metric_configuration.id)
end

When(/^I visit the sample metric configuration page$/) do
  visit kalibro_configuration_metric_configuration_path(@metric_configuration.configuration_id, @metric_configuration.id)
end

When(/^I visit the sample metric configuration page$/) do
  visit edit_kalibro_configuration_path(@kalibro_configuration.id)
end

Then(/^I am at the sample metric configuration page$/) do
  visit kalibro_configuration_metric_configuration_path(@metric_configuration.configuration_id, @metric_configuration.id)
  expect(page).to have_content(@metric_configuration.metric.name)
  expect(page).to have_content("Ranges")
end

Then(/^I should see the sample metric configuration content$/) do
  expect(page).to have_content(@metric_configuration.metric.name)
  expect(page).to have_content(@metric_configuration.code)
  expect(page).to have_content(@metric_configuration.weight)
end

Then(/^I should be at metric configuration sample page$/) do
  expect(page).to have_content(@metric_configuration.metric.name)
  expect(page).to have_content("Ranges")
end

Then(/^I should be at the choose metric page$/) do
  expect(page).to have_content("Choose a metric from a Base Tool:")
end
