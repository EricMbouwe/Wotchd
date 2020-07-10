Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :registrations, except: [:index]
  resources :programs, only: [:new, :index, :create, :destroy]
  resources :groups, only: [:new, :index, :create, :show]
  resources :users, only: [:show]
end