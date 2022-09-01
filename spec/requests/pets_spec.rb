require 'swagger_helper'

RSpec.describe 'pets', type: :request do

  path '/pets' do

    get('list pets') do
      response(200, 'successful') do

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
      response(201, 'successful') do
        let(:pet) { { name: "Nate Dogg", animal_type: "dog" } }
        consumes 'application/json'
        parameter name: :pet, in: :body, schema: {
          type: :object,
          properties:  {
            name: { type: :string },
            animal_type: { type: :string },
            breed: { type: :string },
            adoption_status: { type: :string },
            comments: { type: :string },
            created_at: { type: :datetime },
            updated_at: { type: :datatime },
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
        let(:pet) { { id: "random", name: "DMX", animal_type: "dog" } }
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
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get('show pet') do
      Pet.destroy_all
      pet = Pet.create!(:id=> 1, :name => 'DMX', :animal_type => "dog")

      response(200, 'successful') do
        let(:id) { "1" }

        schema type: :object,
        properties: {
          id: { type: :integer, },
          name: { type: :string },
          animal_type: { type: :string },
        },
        required: [ 'id', 'name', 'animal_type' ]

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        let(:pet) { {:name => "bobby", :animal_type=> "cat" } }
        run_test!
      end
    end

    patch('update some properties of a pet') do
      Pet.destroy_all
      pet = Pet.create!(:id=> 1, :name => 'DMX', :animal_type => "dog")
      response(200, 'successful') do
        let(:id) {'1'}
        consumes 'application/json'
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
          required: ['id']
        }
        
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        let(:pet) { {:name => "bobby", :animal_type=> "cat" } }
        run_test!
      end
    end

    put('update pet') do
      Pet.destroy_all
      pet = Pet.create!(:id=> 1, :name => 'DMX', :animal_type => "dog")
      response(200, 'successful') do
        let(:id) { '1' }
        consumes 'application/json'
        parameter name: :pet, in: :body, schema: {
          properties: {
            name: { type: :string },
            animal_type: { type: :string }
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
        let(:pet){ { :name => "DMX", :animal_type =>"dog" } }
      end
    end

    delete('delete pet') do
      Pet.destroy_all
      pet = Pet.create!(:id=> 1, :name => 'DMX', :animal_type => "dog")
      response(202, 'successful') do
        let(:id) { '1'}

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
