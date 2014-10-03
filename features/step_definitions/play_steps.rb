Given(/^I am on the play page$/) do
  visit('/play')
end

When(/^I choose an option$/) do
 	choose('rps_rock')
 	click_button('Play')
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content text
end