require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(
      name: 'Mauro',
      photo: 'https://thispersondoesntexist.com/image',
      bio: 'This should be a text box that allows only strings'
    )
  end

  it 'should create a new user' do
    expect(subject).to be_truthy
    expect(subject.name).to eq('Mauro')
  end
  it 'should return the last three posts' do
    subject.posts.create(title: 'New Post', text: 'New text')
    subject.posts.create(title: 'New Post2', text: 'New text2')
    subject.posts.create(title: 'New Post3', text: 'New text3')
    subject.posts.create(title: 'New Post4', text: 'New text4')
    expect(subject.most_recent.size).to eq(3)
  end
end
