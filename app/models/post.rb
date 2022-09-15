class Post < ApplicationRecord
  has_many :likes
  has_many :comments, inverse_of: 'post'
  belongs_to :author, class_name: 'User'

  after_save :update_post_counter

  private

  def update_post_counter
    author.increment!(:post_counter)
  end
end
