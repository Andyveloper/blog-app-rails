require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) do
      get users_path
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'returns correct rendering' do
      expect(response.body).to render_template(:index)
    end
    it 'returns correct body placeholder' do
      expect(response.body).to include('Find me in app/views/users/index.html.erb')
    end
  end
end
