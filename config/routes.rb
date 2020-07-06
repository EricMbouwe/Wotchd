Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :registrations, except: [:index]
  root to: 'sessions#new'
end