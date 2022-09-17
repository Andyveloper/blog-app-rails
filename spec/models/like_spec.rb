require 'rails_helper'

RSpec.describe Like, type: :model do
  new_post = Post.create(title: 'Testing unit', author: User.create(name: 'David'))
  other_user = User.create(name: 'Elson')
  subject { Like.create(author: other_user, post: new_post) }

  it 'should updated the like counter' do
    expect(subject.post.likes_counter).to be 1
    Like.create(author: subject.author, post: subject.post)
    expect(subject.post.likes_counter).to be 2
  end
end
