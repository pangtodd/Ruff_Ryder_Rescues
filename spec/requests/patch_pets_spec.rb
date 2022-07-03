require "rails_helper"

describe "edit a pet route", :type => :request do
  before do
    @pet = Pet.create!(:name => "test_pet", :animal_type => "dog")
    patch "/pets/#{@pet.id}", params: { :name => "Eric B", :animal_type => "cat" }
  end

  it "updates the pets name, and animal type" do
    get "/pets/#{@pet.id}"
    expect(JSON.parse(response.body)["name"]).to eq("Eric B")
    expect(JSON.parse(response.body)["animal_type"]).to eq("cat")
  end

  it "returns a updated status" do
    expect(response).to have_http_status(:ok)
  end
end

describe "exceptions work as expected", :type => :request do

  it "throws error if name and animal type field is empty" do
    @pet = Pet.create!(:name => "test_pet", :animal_type => "dog")
    patch "/pets/#{@pet.id}", params: { :name => "", :animal_type => "" }
    expect(response).to have_http_status(422)
    expect(JSON.parse(response.body)["message"]).to eq("Validation failed: Name can't be blank, Animal type can't be blank")
  end
end