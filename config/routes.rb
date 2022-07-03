Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :pets

  get '/pets/search', to: 'pets#search'
  #couldn't get this route to work quite right.
end