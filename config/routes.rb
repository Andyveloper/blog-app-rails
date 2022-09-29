Rails.application.routes.draw do
  devise_for :users, path: ""
  resources :users, only: %i[index show] do
    resources :posts do
      resources :comments, only: %i[index create destroy]
      resources :likes, only: %i[create]
    end
  end
  # Defines the root path route ("/")
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show] do
        resources :posts, only: [:index, :show] do
          resources :comments, only: [:create, :index]
        end
      end
    end
  end 
  root 'users#index'
end
