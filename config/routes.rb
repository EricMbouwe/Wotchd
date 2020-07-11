Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, except: [:index]
  resources :programs, only: [:new, :index, :create, :destroy]
  resources :groups, only: [:new, :index, :create, :show]
end