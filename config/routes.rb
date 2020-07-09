Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :registrations, except: [:index]
  resources :programs
  resources :groups
  resources :users, only: [:show, :edit, :update]
  root to: 'static#home'
end