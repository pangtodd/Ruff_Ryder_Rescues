require 'swagger_helper'

RSpec.describe 'pets', type: :request do

  path '/pets' do

    get('list pets') do
      response(200, 'successful') do
        produces 'application/json'
        parameter name: :pet, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            animal_type: { type: :string },
            breed: { type: :string },
            adoption_status: { type: :string },
            comments: { type: :string },
            created_at: { type: :datetime },
            updated_at: { type: :datatime },
          },
        }

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

    post('create pet') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :pet, in: :body, schema: {
          type: :object,
          properties:  {
            name: { type: :string },
            animal_type: { type: :string },
            # breed: { type: :string },
            # adoption_status: { type: :string },
            # comments: { type: :string },
            # created_at: { type: :datetime },
            # updated_at: { type: :datatime },
          },
          required: ['name', 'animal_type']
        }

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

  path '/pets/random' do
    get('list a random pet from the database') do
      response(200, 'successful') do
        produces 'application/json'
        parameter name: :pet, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            animal_type: { type: :string },
            breed: { type: :string },
            adoption_status: { type: :string },
            comments: { type: :string },
            created_at: { type: :datetime },
            updated_at: { type: :datatime },
          },
        }

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

  path '/pets/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show pet') do
      response(200, 'successful') do
        schema type: :object,
        properties: {
          id: { type: :integer, },
          name: { type: :string },
          animal_type: { type: :string },
        },
        required: [ 'id', 'name', 'animal_type' ]
        # let(:id) { Pet.create(name: "bobby", animal_type: "cat") }

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

    # patch('update some properties of a pet') do
    #   response(200, 'successful') do
    #     produces 'application/json'
    #     consumes 'application/json'
    #     parameter name: :pet, in: :body, schema: {
    #       type: :object,
    #       properties: {
    #         # name: { type: :string },
    #         # animal_type: { type: :string },
    #         # breed: { type: :string },
    #         # adoption_status: { type: :string },
    #         # comments: { type: :string },
    #         # created_at: { type: :datetime },
    #         # updated_at: { type: :datatime },
    #       },
    #       required: ['id']
    #     }
        
    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end

    put('update pet') do
      response(200, 'successful') do
        produces 'application/json'
        consumes 'application/json'
        parameter name: :pet, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            animal_type: { type: :string }
          },
          required: ['id', 'name', 'animal_type']
        }

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

    delete('delete pet') do
      response(200, 'successful') do
        let(:id) { '123' }

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
