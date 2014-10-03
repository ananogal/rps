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