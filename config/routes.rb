Rails.application.routes.draw do
  
  put '/addfriend/' => 'users#addfriend'
  put '/accept/' => 'friendships#accept'
  put '/reject/' => 'friendships#reject'

  root 'posts#index'

  devise_for :users

  resources :friendships
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
