class Post < ApplicationRecord
  has_many :likes

  has_many :comments

  belongs_to :author, class_name: 'User'

  after_create do |post|
    post.likes_counter = 0

    post.comments_counter = 0
  end

  after_save :update_post_counter

  validates :title, presence: true, length: { maximum: 250 }

  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.increment!(:post_counter)
  end
end
