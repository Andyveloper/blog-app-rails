require 'rails_helper'

RSpec.describe User, type: :feature do
  describe 'post_index behavioral tests' do
    before(:each) do
      @user = User.create(name: 'Hwayoung', photo: 'https://lh3.googleusercontent.com/h-ZiAriWFOlqtZ8qpnk_3QXlL9UeIObKCbd-EY-8ssMuaaCLNB1-s51n4iXnjf8oqdmJk_IZHgH0XTe6_czMC1MOm-Pl4gRc4Q=w960-rj-nu-e365')
      5.times do
        Post.create(author: @user, title: 'Rspec test', text: 'This is a testing unit')
      end
      10.times do
        Comment.create(author: @user, post: @post1, text: 'This is a unit testing, please ignore')
      end
      @post1 = Post.first
      @posts = @user.posts
      visit user_posts_path(@user.id)
    end

    it 'should let me see the user\'s profile picture' do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end

    it 'should let me see the user' do
      expect(page).to have_content(@user.name)
    end

    it 'should let me see the number of post' do
      expect(page).to have_content(@user.post_counter)
    end

    it 'should let me see the post\'s title' do
      @posts.each do |post|
        expect(page).to have_content(post.title)
      end
    end

    it 'should let me see the post\'s body' do
      @posts.each do |post|
        expect(page).to have_content(post.text)
      end
    end

    it 'should let me see the post\'s comments' do
      @posts.each do |post|
        post.comments.each do |comment|
          expect(page).to have_content(comment.text)
        end
      end
    end

    it 'shows me how many likes does a post have' do
      @posts.each do |post|
        expect(page).to have_content(post.likes_counter)
      end
    end

    it 'should have pagination button' do
      expect(page).to have_content('Pagination')
    end

    it 'should redirect to post show' do
      click_on @post1.id
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end
  end
end
