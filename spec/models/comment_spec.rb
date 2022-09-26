require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.create!(name: 'Barry', post_counter: 0)
    @user2 = User.create!(name: 'Daren', post_counter: 0)
    @post = Post.create!(author: @user, title: 'Magium', text: 'Such a nice book')
  end
 

  it 'should increment the comment count' do
    expect(@post.comments.count).to eq(0)
    @post.comments.create(post: @post, author: @user,
                            text: 'I just want to know why they didnt save the protagonist')
    @post.comments.create(post: @post, author: @user2, text: 'Yeah me too, such a loophole')
    expect(@post.comments.count).to eq(2)
  end
end
