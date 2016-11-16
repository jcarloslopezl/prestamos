Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # Profile
  get 'profile', to: 'users#profile'
  
  # Resources  
  resources :users
  
  resources :requisitions do
    resources :references
  end

  # Root
  root 'home#index'
  
end
