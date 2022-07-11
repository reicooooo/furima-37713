Rails.application.routes.draw do
  devise_for :users

  
  root to: 'products#index'
  resources :products, only: [:index, :new, :create] do   # :update, :destroy] :show, :edit
  end
  resources :users, only: :show
end
