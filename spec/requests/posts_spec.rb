require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      get user_posts_path(user_id: 1)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'returns correct rendering template' do
      expect(response).to render_template(:index)
    end
    it 'returns correct body placeholder' do
      expect(response.body).to include('Find me in app/views/posts/index.html.erb')
    end
  end

  describe 'GET /show' do
    before(:each) do
      get user_post_path(user_id: 1, id: 1)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'returns correct rendering template' do
      expect(response).to render_template(:show)
    end
    it 'returns correct body placeholder' do
      expect(response.body).to include('Find me in app/views/posts/show.html.erb')
    end
  end
end
