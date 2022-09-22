Rails.application.routes.draw do
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show] do
      resources :comments, only: [:new, :create]
    end
  end
  # Defines the root path route ("/")
  root 'users#index'
end
