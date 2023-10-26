require 'rails_helper'

RSpec.describe Like, type: :model do
  fixtures :users, :posts

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  it 'updates the likes_counter of the post' do
    like = Like.create(user: users(:one), post: posts(:one))
    expect(like.post.likes_counter).to eq(1)
  end
end
