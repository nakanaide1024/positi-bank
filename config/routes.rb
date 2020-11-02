Rails.application.routes.draw do
  devise_for :users
  
  get "/users" => "devise/registrations#new"
  root to: "top#index"
end
