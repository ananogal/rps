require_relative 'helper_steps'

Given(/^I enter the homepage$/) do
  visit('/')
end

Then(/^I see a welcome message "(.*?)"$/) do |arg1|
  expect(page).to have_content("Welcome!")
end


Given(/^I am on the homepage$/) do
	visit('/')
end

When(/^I enter my "(.*?)"$/) do |name|
  fill_in('name', :with => name)
end

Then(/^I should be register to play RPS$/) do
  visit('/play')
end

Given(/^I am register in as "(.*?)" in Ana's browser$/) do |name|
  register_in_browser(name, name)
end

When(/^I register in as "(.*?)" in Peter's browser$/) do |name|
  register_in_browser(name, name)
end

Then(/^I should go to play page in Ana's browser$/) do
  Capybara.session_name = 'Ana'
  visit('play')
end
