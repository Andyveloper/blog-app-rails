class User < ApplicationRecord
  has_many :comments, inverse_of: 'author'
  has_many :posts, inverse_of: 'author'
  has_many :likes, inverse_of: 'author'
  def most_recent
    Post.where(author_id).limit(3).order(created_at: :desc)
  end
end
