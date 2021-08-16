Rails.application.routes.draw do
  devise_for :users
  get 'events/index'
  root to: "events#index"
  resources :users, only: [:show]
  resources :events
  resources :tickets, only: [:index, :new, :create, :destroy]
end
