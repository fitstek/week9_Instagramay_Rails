require 'rails_helper'

describe 'tagging posts' do
  context 'when logged in' do
    let!(:fitsum) do
      User.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
    end

    before do
      login_as fitsum
    end

    it 'adds the post to the homepage' do
      visit '/posts/new'
      fill_in 'Title', with: 'My new post'
      fill_in 'Description', with: 'Lorem ipsum'
      fill_in 'Tags', with: '#yolo, #swag'
      click_button 'Post it'

      expect(page).to have_link '#yolo'
      expect(page).to have_link '#swag'
    end

  #   context 'existing posts' do
  #     before do 
  #       fitsum.posts.create title: 'Pic1', tag_names: 'yolo'
  #       fitsum.posts.create title: 'Pic2', tag_names: 'swag'

  #       visit '/posts'
  #     end

  #     it 'should filter posts by selected tag' do

  #       click_link 'yolo'
  #       expect(page).to have_css 'h1', 'posts associated with yolo'
  #       expect(page).to have_content 'Pic1'
  #       expect(page).not_to have_content 'Pic2'
  #     end 

  #     it 'uses the tag name in the url' do
  #       click_link 'yolo'

  #       expect(current_path).to eq '/tags/yolo'
  #     end
  #   end
  end
end