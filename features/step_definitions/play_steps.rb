require_relative 'helper_steps'

Given(/^I am on the play page$/) do
  visit('/play')
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content text
end

Given(/^game is ready to play$/) do
  	register_in_browser("browser_Ana", "Ana")
  	register_in_browser("browser_Peter", "Peter")
  	Capybara.session_name = "browser_Ana"
  	visit('/play')
end

When(/^I select a choise$/) do
  choose('rps_rock')
  click_button('Play')
end











# Given(/^I am on the play page$/) do
#   visit('/play')
# end

# Then(/^I should see "(.*?)"$/) do |text|
#   expect(page).to have_content text
# end

# When(/^I select a choise$/) do
#   	choose('rps_rock')
#  	click_button('Play')
# end