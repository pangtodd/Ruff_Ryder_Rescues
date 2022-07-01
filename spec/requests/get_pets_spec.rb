require 'rails_helper'

describe "get all pets route", :type => :request do
  let!(:pets) { FactoryBot.create_list(:pet, 20)}

  before { get '/pets'}

  it 'returns all pets' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'can return a single pet by id' do
    @id = JSON.parse(response.body).first["id"]
    get "/pets/#{@id}"
    expect(response).to have_http_status(:success)
    # expect(JSON.parse(response.body).size).to eq(2)
  end

end