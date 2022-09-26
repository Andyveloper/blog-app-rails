require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      user = User.create(name: 'Aiden')
      get user_posts_path(user.id)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'returns correct rendering template' do
      expect(response).to render_template(:index)
    end
    it 'returns correct body placeholder' do
      expect(response.body).to include('This user has no posts')
    end
  end

  describe 'GET /show' do
    before(:each) do
      user = User.create(name: 'Aiden')
      post = Post.create(author: user, title: 'Book1')
      get user_post_path(user.id, post.id)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'returns correct rendering template' do
      expect(response).to render_template(:show)
    end
    it 'returns correct body placeholder' do
      expect(response.body).to include('This user has no comments')
    end
  end
end
