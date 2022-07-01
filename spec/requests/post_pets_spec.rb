require 'rails_helper'

describe "post a pet route", :type => :request do

  it 'returns an error if bad data is passed' do
    post '/pets', params: { :name => 'test_pet', :animal_type => '' }
    expect(response).to have_http_status(422)
  end

  before do
    post '/pets', params: { :name => 'test_pet', :animal_type => 'dog' }
  end

  it 'returns the pet name' do
    expect(JSON.parse(response.body)['name']).to eq('test_pet')
  end

  it 'returns the pet animal type' do
    expect(JSON.parse(response.body)['animal_type']).to eq('dog')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end