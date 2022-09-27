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

  
end