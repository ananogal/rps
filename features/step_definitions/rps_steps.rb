require_relative 'helper_steps'

Given(/^I enter the homepage$/) do
  visit('/')
end

Then(/^I see a message "(.*?)"$/) do |arg1|
  expect(page).to have_content("Rock, paper, scissors!")
end

Given(/^I am on the homepage$/) do
  visit('/')
end

When(/^I click 'sign in' without given a name$/) do
  click_button('sign in')
end

Then(/^I should see a message 'Please enter your name'$/) do
  expect(page).to have_content('Please enter your name')
end

When(/^I enter my "(.*?)"$/) do |name|
  fill_in('name', :with => name)
  visit('/welcome')
end

Then(/^I should see a welcome message with my name$/) do
  expect(page).to have_content("Welcome")
end

Given(/^I am register in as "(.*?)"$/) do |player1|
  in_browser('first') do
  	register(player1)
	end
end

When(/^a second player register$/) do
  in_browser('second') do
  	register('Peter')
  end
end

Then(/^I should go to play page in Ana's browser$/) do
  in_browser('first') do
  	visit('/play')
  	expect(page).to have_content('Hi, Ana.')
  end
end

Then(/^see message "Your oppunent turn, please wait" in second player browser$/) do 
  in_browser('second') do
  	expect(page).to have_content('Your oppunent turn, please wait')
  end
end

Given(/^I am in the play page$/) do
  in_browser('first') do
  	visit('play')
  end
end


When(/^I select a choice$/) do
  in_browser('first') do
  	choose('rps_rock')
 	 	click_button('Play')
 	end
end

Then(/^I should see "Waiting for your opponent to make a move"$/) do 
	in_browser('first') do
  	expect(page).to have_content('Waiting for your opponent to make a move')
  end
end