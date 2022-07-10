Rails.application.routes.draw do
  devise_for :users

  
  root to: 'products#index'
  resources :products, only: [:index, :new, :create,] do   #:edit,　:show, :update, :destroy] 
  end
  resources :users, only: :show
end
