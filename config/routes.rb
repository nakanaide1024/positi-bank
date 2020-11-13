Rails.application.routes.draw do
  devise_for :users
  
  root to: "top#index"
  get "/taken", to: "top#show"
  get "/blogs.:id", to: "blogs#index"

  resources :posits, only: [:new, :create, :index, :destroy, :show] do
    get 'add' => 'likes#checked'
    get 'check' => 'likes#confirmation'
    post 'add' => 'likes#create'
    delete '/add' => 'likes#destroy'
  end
  
  resources :blogs, only: [:new, :create, :destroy, :edit, :update, :show]
  resources :users, only: [:show] do
    resources :addresses, only: [:new, :create]
  end
  resources :letters, only: [:index, :show, :edit, :destroy, :update]

end
