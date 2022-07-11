Rails.application.routes.draw do
  devise_for :users

  
  root to: 'products#index'
  resources :products, only: [:index, :new, :create, :show,] do   # :update, :destroy]  :edit
  end
  resources :users, only: :show
end
