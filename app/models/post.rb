class Post < ApplicationRecord
  has_many :likes
  has_many :comments, inverse_of: 'post'
  belongs_to :author, class_name: 'User'

  def self.update_post_counter(user)
    user.post_counter = Post.where(author: user).count
  end

  after_save :update_post_counter

  private

  def update_post_counter
    author.increment!(:post_counter)
  end
end
