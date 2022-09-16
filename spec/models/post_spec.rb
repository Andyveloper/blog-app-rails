require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.create(
      title: 'Post Title',
      text: 'This is a test post, but it should be awesome',
      author: User.create(
        name: 'Mauro',
        photo: 'https://thispersondoesntexist.com/image',
        bio: 'This should be a text box that allows only strings'
      )
    )
  end

  it 'should create a new post' do
    expect(subject).to be_truthy
  end
  it 'should return last 5 comments of any post' do
    10.times do
      Comment.create(author: subject.author, post: subject, text: 'Comment required for this post')
    end
    expect(subject.most_recent.size).to eq(5)
  end
end
