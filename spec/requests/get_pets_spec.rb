require 'rails_helper'

describe "get all pets route", :type => :request do
  let!(:pets) {FactoryBot.create_list(:pet, 19)}

  before { get '/pets'}

  it 'returns all pets' do
    expect(JSON.parse(response.body).size). to be (20)
    # this error is due to swagger, working on fixing.
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