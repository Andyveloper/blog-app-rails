require 'rails_helper'

RSpec.describe User, type: :feature do
  before(:each) do
    @user = User.create(name: 'Hwayoung', photo: 'https://lh3.googleusercontent.com/h-ZiAriWFOlqtZ8qpnk_3QXlL9UeIObKCbd-EY-8ssMuaaCLNB1-s51n4iXnjf8oqdmJk_IZHgH0XTe6_czMC1MOm-Pl4gRc4Q=w960-rj-nu-e365')
    5.times do
      Post.create(author: @user, title: 'Rspec test', text: 'This is a testing unit')
    end
    @posts = @user.posts.all
  end

  it 'should render the profile picture' do
    visit user_path(@user.id)
    expect(page).to have_css("img[src*='#{@user.photo}']")
  end

  it 'should see the username' do
    visit user_path(@user.id)
    expect(page).to have_content(@user.name)
  end

  it 'should show the number of posts written by this author' do
    visit user_path(@user.id)
    expect(page).to have_content(@user.post_counter)
  end

  it 'should show the number of posts written by this author' do
    visit user_path(@user.id)
    expect(page).to have_content(@user.bio)
  end

  it 'should show the number of posts written by this author' do
    visit user_path(@user.id)

    expect(page).to have_content(@user.posts.first.text)
    expect(page).to have_content(@user.posts.second.text)
    expect(page).to have_content(@user.posts.third.text)
  end

  it 'shows a button that let me view user posts' do
    visit user_path(@user.id)
    expect(page).to have_content('See all posts')
  end

  it 'redirects me to posts show page' do
    visit user_path(@user.id)
    expect(page).to have_css("a[href*='/users/#{@user.id}']")
  end

  it 'is a button that let me view user posts' do
    visit user_path(@user.id)
    click_on 'See all posts'
    expect(current_path).to eq(user_posts_path(@user.id))
  end
end
