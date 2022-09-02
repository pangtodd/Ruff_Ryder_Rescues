require "rails_helper"

describe "delete a pet route", :type => :request do
  before do
    Pet.destroy_all
    @pet = Pet.create!(:name => "test_pet", :animal_type => "dog")
    delete "/pets/#{@pet.id}"
  end

  it "deletes the quote" do
    expect(response).to have_http_status(202)
    expect(JSON.parse(response.body)["message"]).to eq("entry successfully deleted.")
  end
end