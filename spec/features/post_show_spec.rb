require 'rails_helper'

RSpec.describe User, type: :feature do
  before(:each) do
    @user = User.create(name: 'Hwayoung', photo: 'https://lh3.googleusercontent.com/h-ZiAriWFOlqtZ8qpnk_3QXlL9UeIObKCbd-EY-8ssMuaaCLNB1-s51n4iXnjf8oqdmJk_IZHgH0XTe6_czMC1MOm-Pl4gRc4Q=w960-rj-nu-e365')
    5.times do
      Post.create(author: @user, title: 'Rspec test', text: 'This is a testing unit')
    end
    @post1 = Post.first
    10.times do
      Comment.create(author: @user, post: @post1, text: 'This is a unit testing, please ignore')
    end
    @posts = @user.posts
    visit user_post_path(@user.id, @post1.id)
  end

  it 'shows the post title' do
    expect(page).to have_content(@post1.title)
  end

  it 'should show the post\'s author' do
    expect(page).to have_content(@post1.author.name)
  end

  it 'should let me see how many comments it has' do
    expect(page).to have_content(@post1.comments.count)
  end

  it 'should let me see how many likes it has' do
    expect(page).to have_content(@post1.likes_counter)
  end

  it 'should render the post\'s body' do
    expect(page).to have_content(@post1.text)
  end

  it 'should render the commentors name' do
    expect(page).to have_content(@user.name)
  end

  it 'should render the text of each comment' do
    @posts.each do |post|
      post.comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end