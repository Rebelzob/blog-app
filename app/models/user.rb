class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  def three_last_posts
    posts.order(created_at: :desc).limit(3)
  end
end
