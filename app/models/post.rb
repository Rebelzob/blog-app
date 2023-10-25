class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def update_post_counter
    user.update(posts_counter: user.posts.count)
  end

  def five_recent_comments_from_post
    comments.order(created_at: :desc).limit(5)
  end
end
