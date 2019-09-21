Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
  resources :reviews, only: [:new, :create]
  
end
  root 'products#index'
end
