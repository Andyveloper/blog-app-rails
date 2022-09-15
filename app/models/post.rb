class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User'

  after_save :update_post_counter

  def most_recent
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.increment!(:post_counter)
  end
end
