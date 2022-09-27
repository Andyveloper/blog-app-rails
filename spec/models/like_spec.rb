require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @author = User.create(name: 'Mauro')

    post1 = Post.create(title: 'Testing unit', author: User.create(name: 'Hwayoung'))
    @like = Like.create(author: @author, post: post1)
  end

  it 'should update the like counter' do
    expect(@like.post.likes_counter).to be 1
    Like.create(author: @like.author, post: @like.post)
    expect(@like.post.likes_counter).to be 2
  end
end
