Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, only: [:index, :show]
  namespace :api do
    resources :posts, only: [:create]
  end
end
