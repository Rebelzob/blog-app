class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_post_counter

  def five_recent_comments_from_post
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    user.update(posts_counter: user.posts.count)
  end
end
