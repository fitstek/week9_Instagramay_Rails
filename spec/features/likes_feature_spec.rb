require 'rails_helper'

describe 'liking posts' do
  before do
    fitsum = User.create(email: 'f@f.com', password: '12345678', password_confirmation: '12345678')
    fitsum.posts.create(title: 'Cool post', description: 'Hello world')
  end

  it 'it has 0 likes at first' do
    visit posts_path
    expect(page).to have_link '❤ 0'
  end

  it 'can be liked, incrementing the likes count', js: true do
    visit posts_path
    click_link '❤ 0'
    expect(page).to have_link '❤1'
  end

  it 'can only be liked once per user', js: true do
    visit posts_path
    click_link '❤ 0'
    click_link '❤ 1'
    expect(page).to have_link '❤1'
  end
end