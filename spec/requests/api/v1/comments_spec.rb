require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do

  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'post_id', in: :path, type: :string, description: 'post_id'

    get('List Comments') do
      produces 'application/json'
      tags 'Comments'
      security [ BearerAuth: [] ]

      response(200, 'Successful') do
        let(:user_id) { '123' }
        let(:post_id) { '123' }

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

    post('Create Comment') do
      tags 'Comments'
      consumes 'application/json'
      security [ BearerAuth: [] ]
      parameter text: :string, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: ["text"]
      }
      response(200, 'successful') do
        let(:user_id) { '123' }
        let(:post_id) { '123' }

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