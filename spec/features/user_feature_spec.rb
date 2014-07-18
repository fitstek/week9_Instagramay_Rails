require 'rails_helper'

describe 'user registration and login' do
	it 'user can sign up' do
		visit '/users/sign_up'
		fill_in 'Email', with: 'f@f.com'
		fill_in 'Password', with: '12345678'
		fill_in 'Password confirmation', with: '12345678'
		click_button 'Sign up'

		expect(page).to have_content 'Signed up successfully'
	end

	it 'user can sign in' do
		User.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
		visit '/users/sign_in'
		fill_in 'Email', with: 'f@f.com'
		fill_in 'Password', with: '12345678'
		click_button 'Sign in'

		expect(page).to have_content 'Signed in successfully'
	end
end