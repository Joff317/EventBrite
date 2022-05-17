Rails.application.routes.draw do
  get 'static_pages/index'
  get 'static_pages/secret'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'events#index' 

  resources :attendances
  resources :events
  resources :users
  resources :teams, only: [:index]
  resources :contacts, only: [:index]
  root 'events#index'
end
