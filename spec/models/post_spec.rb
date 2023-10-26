require 'rails_helper'

RSpec.describe Post, type: :model do
  fixtures :posts, :comments

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
  end

  it 'validates that title should not be empty' do
    post = posts(:one)
    expect(post.title).not_to be_empty
  end

  it 'validates that title should be empty' do
    post = posts(:two)
    expect(post.title).to be_empty
  end

  it 'validates comments_counter should be greater than or equal to 0 and integer' do
    post = posts(:three)
    expect(post.comments_counter).to be >= 0
    expect(post.comments_counter).to be_a(Integer)
  end

  it 'validates that comments_counter should not be greater than or equal to 0' do
    post = posts(:two)
    expect(post.comments_counter).not_to be >= 0
  end

  it 'validates that likes_counter should be greater than or equal to 0 and integer' do
    post = posts(:one)
    expect(post.likes_counter).to be >= 0
    expect(post.likes_counter).to be_a(Integer)
  end

  it 'validates that likes_counter should not be greater than or equal to 0' do
    post = posts(:two)
    expect(post.likes_counter).not_to be >= 0
  end

  describe '#five_recent_comments_from_post' do
    it 'returns the five most recent comments' do
      post = posts(:one)

      recent_comments = post.five_recent_comments_from_post

      expect(recent_comments.length).to eq(5)
      expect(recent_comments[0]).to eq(comments(:one))
      expect(recent_comments[1]).to eq(comments(:two))
      expect(recent_comments[2]).to eq(comments(:three))
      expect(recent_comments[3]).to eq(comments(:four))
      expect(recent_comments[4]).to eq(comments(:five))
    end
  end
end
