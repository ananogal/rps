
def in_browser(browser)
	old_session = Capybara.session_name
  Capybara.session_name = browser
  yield
  Capybara.session_name = old_session
end

def register(name)
	visit('/')
	fill_in('name', with: name)
	click_button('sign in')
end


