require 'rails_helper'
require 'pry'

describe "get all pets route", :type => :request do
  let!(:pets) {FactoryBot.create_list(:pet, 20)}

  before { get '/pets'}

  it 'returns all pets' do
    # binding.pry
    expect(JSON.parse(response.body)).not_to be_empty
    expect(JSON.parse(response.body)).to be_instance_of Array
    expect(response).to have_http_status :success
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'can return a single pet by id' do
    @id = JSON.parse(response.body).first["id"]
    get "/pets/#{@id}"
    expect(response).to have_http_status(:success)

  end

end