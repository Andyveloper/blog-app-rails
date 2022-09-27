Rails.application.routes.draw do
  devise_for :users
  get 'likes/create'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[create]
      resources :likes, only: %i[create]
    end
  end
  # Defines the root path route ("/")
  root 'users#index'
end
