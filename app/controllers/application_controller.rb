class ApplicationController < ActionController::API
  include Response

  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({ message: exception.message }, 422)
  end

  # breaks 
  # rescue_from ActiveRecord:::BadRequest do |exception|
  #   json_response({ message: exception.message }, :bad_request)
  # end

end
