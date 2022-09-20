require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      get user_posts_path(user_id: 1)
    end
    it 'returns http success' do
      get '/posts/index'
      expect(response).to have_http_status(:success)
    end
  end
end
