require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  fixtures :users, :posts

  describe 'GET #index' do
    before do
      get user_posts_path(posts(:one))
    end

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'returns all posts' do
      expect(assigns(:posts)).to eq(posts)
    end

    it 'body contains text "Shows posts per user"' do
      expect(response.body).to include('Shows posts per user')
    end
  end

  describe 'GET #show' do
    before do
      get user_post_path(users(:one), posts(:one))
    end

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'body contains text "Blog single post"' do
      expect(response.body).to include('Blog single post')
    end
  end
end
