Rails.application.routes.draw do
  
  resources :events do 
    resources :attendances
    resources :orders, only: [:new, :create]
  end
  get 'static_pages/index'
  get 'static_pages/secret'
  get 'contact/index'
  get 'team/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'events#index' 

  
  resources :events
  resources :users, only: [:show] do 
    resources :avatars, only: [:create]
  end
  resources :teams, only: [:index]
  resources :contacts, only: [:index]
end
