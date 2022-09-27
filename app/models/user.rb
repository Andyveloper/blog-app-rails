class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, foreign_key: 'author_id'

  has_many :posts, foreign_key: 'author_id'

  has_many :likes, foreign_key: 'author_id'

  after_create do |user|
    user.post_counter = 0
  end

  validates :name, presence: true

  validates :post_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent
    posts.order(created_at: :asc).limit(3)
  end
end
