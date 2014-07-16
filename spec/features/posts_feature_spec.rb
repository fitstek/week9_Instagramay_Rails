require 'rails_helper'

def fill_form(title,description)
		visit '/posts/new'
		fill_in 'Title', with: title
		fill_in 'Description', with: description
	end

describe 'posts' do
	it 'tells me there are no posts' do
		visit '/posts'
		expect(page).to have_content 'No posts yet'
	end

	it 'can add posts' do
		fill_form( 'My instagram' , 'cool')
		click_button 'Post it'

		expect(page).to have_content 'My instagram'
		expect(page).to have_content 'cool'
	end

	it 'can display posts' do
		fill_form( 'My instagram' , 'cool')
		click_button 'Post it'

		expect(current_path).to eq '/posts'
		expect(page).to have_content 'My instagram'
	end

	it 'can add photos to posts' do
		fill_form( 'My instagram' , 'cool')
		attach_file 'Image', Rails.root.join('spec/images/old-man.jpg')
		click_button 'Post it'

		expect(current_path).to eq posts_path
		expect(page).to have_css 'img.uploaded-pic'
	end
end