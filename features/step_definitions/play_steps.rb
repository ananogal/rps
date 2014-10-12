# require_relative 'helper_steps'

Given(/^I am on the play page$/) do
  visit('/play')
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content text
end

Given(/^game is ready to play$/) do
	game_is_ready
  	# save_and_open_page
end

When(/^I select a choice$/) do
  choose('rps_rock')
  click_button('Play')
end

Given(/^Player(\d+) selects a choice$/) do |arg1|
 	game_is_ready
 	choose('rps_rock')
  	click_button('Play')
end

Then(/^Player(\d+) must select a choice$/) do |arg1|
  	Capybara.session_name = "browser_Peter"
  	choose('rps_rock')
  	click_button('Play')	
end

def game_is_ready
	Capybara.reset_session!
  	register_in_browser("browser_Ana", "Ana")
  	register_in_browser("browser_Peter", "Peter")
  	Capybara.session_name = "browser_Ana"
  	visit('/play')
end


