Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :registrations, only: [:create]
  root to: 'sessions#new'
end