Rails.application.routes.draw do
  
	# Profile
  get 'profile', to: 'users#profile'
  resources :users

  # Session
  get 'auth/:provider/callback', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'

  root 'home#index'
  
end
