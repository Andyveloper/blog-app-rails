require 'swagger_helper'

RSpec.describe 'api/v1/authentication', type: :request do

  
  path '/api/v1/login' do

    post('Login Authentication') do

      parameter :email
      parameter :password

      response(200, 'Successful') do
        let(:user) {{ email: "testingapi@gmail.com", password: "123456" } }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
          run_test!
        end
      end
    end
  end

