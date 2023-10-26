require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users, :posts, :comments, :likes

  describe 'associations' do
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
  end

  it 'validates that name should not be empty' do
    user = users(:one)
    expect(user.name).not_to be_empty
  end

  it 'validates posts_counter should be greater than or equal to 0 and integer' do
    user = users(:one)
    expect(user.posts_counter).to be >= 0
    expect(user.posts_counter).to be_a(Integer)
  end

  it 'validates that posts_counter should not be greater than or equal to 0' do
    user = users(:two)
    expect(user.posts_counter).not_to be >= 0
  end

  describe '#three_last_posts' do
    it 'returns the three most recent posts' do
      user = users(:one)

      recent_posts = user.three_last_posts

      expect(recent_posts.length).to eq(3)
      expect(recent_posts[0]).to eq(posts(:one))
      expect(recent_posts[1]).to eq(posts(:two))
      expect(recent_posts[2]).to eq(posts(:three))
    end
  end
end
