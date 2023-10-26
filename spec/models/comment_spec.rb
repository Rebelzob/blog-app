require 'rails_helper'

RSpec.describe Comment, type: :model do
  fixtures :users, :posts

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  it 'update the comments_counter of the post' do
    comment = Comment.create(user: users(:one), post: posts(:one), text: 'Hello')
    expect(comment.post.comments_counter).to eq(1)
  end
end
