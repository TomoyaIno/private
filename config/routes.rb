Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
     collection do
      get 'detail'
    end
  resources :reviews, only: [:new, :create, :update]
  resources :users, only: :show
end
  root 'products#index'
end
