require 'rails_helper'

RSpec.describe 'Users', type: :request do
  fixtures :users

  describe 'GET #index' do
    before do
      get users_path
    end

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'returns all users' do
      expect(assigns(:users)).to eq(users)
    end

    it 'body contains text "All users"' do
      expect(response.body).to include('All users')
    end
  end

  describe 'GET #show' do
    before do
      get user_path(users(:one))
    end

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'body contains text "User info"' do
      expect(response.body).to include('User info')
    end
  end
end
