require 'rails_helper'

describe 'liking posts' do
  let(:fitsum) {create(:user)}
  before do
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
    click_link '❤1'
    expect(page).to have_link '❤1'
  end
end