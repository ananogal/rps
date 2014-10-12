
def register_in_browser(browser, name)
	Capybara.session_name = browser
	register('name', name)
end

def register(field, name)
	visit('/')
	fill_in(field, with: name)
	click_button('sign in')
end

