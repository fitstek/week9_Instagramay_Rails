require 'rails_helper'

def fill_form(title,description)
		visit '/posts/new'
		fill_in 'Title', with: title
		fill_in 'Description', with: description
	end

describe 'posts' do
	context 'While logged out' do
		it 'is impossible' do
			visit '/posts'
			click_link 'Create a post'
			expect(page).to have_content 'Sign in'
			expect(page).not_to have_field 'Title'

		end
	end

	context 'While logged in' do

		context 'When there are no posts' do
			it 'tells me there are no posts' do
			visit '/posts'
			expect(page).to have_content 'No posts yet'
			end
		end

		context 'when something is posted' do
			before do
				fitsum = User.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
				fitsum.posts.create(title: 'My instagram', description: 'cool')
			end
			

			it 'can add posts' do
				visit '/posts'
				expect(page).to have_content 'My instagram'
				expect(page).to have_content 'cool'
				expect(page).not_to have_css 'img.uploaded-pic'
			end

			it 'can display posts on home page' do
				visit '/posts'				
				expect(current_path).to eq '/posts'
				expect(page).to have_content 'My instagram'
				expect(page).not_to have_css 'img.uploaded-pic'
				expect(page).to have_content 'Posted by: f@f.com'

			end
		end
		context 'can attach photos too and display them too' do 	
			it 'can add photos to posts' do
				fitsum = User.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
				login_as fitsum
				visit '/posts'
				click_link 'Create a post'
				fill_form( 'My instagram' , 'cool')
				attach_file 'Image', Rails.root.join('spec/images/old-man.jpg')
				click_button 'Post it'

				expect(current_path).to eq posts_path
				expect(page).to have_css 'img.uploaded-pic'
			end
		end
	end
end