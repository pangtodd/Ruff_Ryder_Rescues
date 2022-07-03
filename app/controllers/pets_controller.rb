class PetsController < ApplicationController

  def index
    if params[:name]
      name = params[:name]
      @pets = Pet.name_search(name)
    elsif params[:animal_type]
      type = params[:animal_type]
      @pets = Pet.type_search(type)
    else
      @pets = Pet.all
    end
    json_response(@pets)
  end

  def show
    if params[:id]== "random"
      @pet = Pet.find(Pet.pluck(:id).sample)
    else  
      @pet = Pet.find(params[:id])
    end
    json_response(@pet)
  end

  def create
    @pet = Pet.create!(pet_params)
    json_response(@pet, :created)
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update!(pet_params)
      render status: 200, json: {
        message: "this pet entry has been updated."
      }
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    if @pet.destroy!
      render status:202, json: {
        message: "entry successfully deleted."
      }
    end
  end

  # couldn't quite get this to work out.
  # def search
  #   if params[:name]
  #     name = params[:name]
  #     @pets = Pet.name_search(name)
  #   elsif params[:animal_type]
  #     type = params[:animal_type]
  #     @pets = Pet.type_search(type)
  #   else
  #     @pets = Pet.all
  #   end
  #   json_response(@pets)
  # end


  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def pet_params
    params.permit(:name, :animal_type, :adoption_status, :comments, :breed)
  end
end