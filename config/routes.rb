Rails.application.routes.draw do
  devise_for :users, path: ""
  resources :users, only: %i[index show] do
    resources :posts do
      resources :comments, only: %i[create destroy]
      resources :likes, only: %i[create]
    end
  end
  # Defines the root path route ("/")
  root 'users#index'
end
