Rails.application.routes.draw do
  devise_for :users
  
  root to: "top#index"
  get "/blogs.:id", to: "blogs#index"

  resources :posits, only: [:new, :create, :index, :destroy, :show]
  resources :blogs, only: [:new, :create, :destroy, :edit, :update, :show]

end
