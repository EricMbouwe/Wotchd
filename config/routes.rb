Rails.application.routes.draw do
  root to: 'static#home'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, except: [:index]
  get :details, to: 'users#details'
  resources :programs, only: [:new, :index, :create, :destroy]
  resources :groups, except: [:destroy]
end