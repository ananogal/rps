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

Given(/^I am waiting for the secondplayer to join$/) do
  register('name', "Ana")
  visit('/welcome')
end

When(/^Another player signs in$/) do
  register('name', "Peter")
end

When(/^I refresh the page$/) do
  visit('/')
end

Then(/^I should go to play page$/) do
  visit('/play')
end

def register(field, name)
	visit('/')
	fill_in(field, with: name)
end