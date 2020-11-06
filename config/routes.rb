Rails.application.routes.draw do
  devise_for :users
  
  root to: "top#index"
  get "/blogs.:id", to: "blogs#index"

  resources :posits, only: [:new, :create, :index, :destroy]
  resources :blogs, only: [:new, :create,]

end
