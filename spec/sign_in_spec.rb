describe 'Sign In Page' do
	it 'logs in with valid credentials' do
		sign_in_page.login('valid@user.com', 'Password')
    expect(home_page.displayed?).to eq true
	end

	it 'fails to log in with invalid credentials' do
		sign_in_page.login('blah@blah.com', 'blah')
		expect(exists { wait { text_exact('There was a problem signing in. Please check that your email and password are correct and try again.') } }).to eq true
	end
end
