require 'swagger_helper'

RSpec.describe 'api/v1/authentication', type: :request do
  before(:all) do
    @user = User.create(
      name: "サトシ", 
      email: "testingapi@gmail.com", 
      password: "123456", 
      password_confirmation: "123456"
    )
  end
  
  path '/api/v1/login' do

    post('Login Authentication') do
      tags 'User'
      consumes 'application/json'
      parameter name: :user, in: :body,
      schema: {
        type: :object, 
        properties: { 
          email: { type: :string }, 
          password: { type: :string } 
        },
         required: ['email', 'password']
      }

      response '200', 'Successful' do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
          run_test!
      end
      response '401', 'Unauthorized' do
        let(:user) {{ email: "testingapi@gmail.com", password: "555000" } }
        run_test!
      end
    end
  end
end
