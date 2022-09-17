require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create!(name: 'Barry')
  user2 = User.create!(name: 'Daren')

  subject do
    Post.create!(author: user, title: 'Magium', text: 'Such a nice book')
  end

  it 'should increment the comment count' do
    expect(subject.comments.count).to eq(0)
    subject.comments.create(post: subject, author: user,
                            text: 'I just want to know why they didnt save the protagonist')
    subject.comments.create(post: subject, author: user2, text: 'Yeah me too, such a loophole')
    expect(subject.comments.count).to eq(2)
  end
end
