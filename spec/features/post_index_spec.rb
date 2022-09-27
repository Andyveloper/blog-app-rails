require 'rails_helper'

RSpec.describe User, type: :feature do
  before(:each) do
    @user = User.create(name: 'Hwayoung', photo: 'https://lh3.googleusercontent.com/h-ZiAriWFOlqtZ8qpnk_3QXlL9UeIObKCbd-EY-8ssMuaaCLNB1-s51n4iXnjf8oqdmJk_IZHgH0XTe6_czMC1MOm-Pl4gRc4Q=w960-rj-nu-e365')
    5.times do
      Post.create(author: @user, title: 'Rspec test', text: 'This is a testing unit')
    end
    @posts = @user.posts.all
    visit user_posts_path(@user.id)
  end

  describe 'post_index behavioral tests' do
    it 'should let me see the user\'s profile picture' do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end
  end
end
