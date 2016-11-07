Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # Profile
  get 'profile', to: 'users#profile'
  
  # Resources  
  resources :requisitions do
    resources :references
  end
  resources :users

  # Session
  # get 'auth/:provider/callback', to: 'sessions#create'
  # delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'

  # Root
  root 'home#index'
  
end
