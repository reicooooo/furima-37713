Rails.application.routes.draw do
  devise_for :users
  root  'users#index' 

  root to: "products#index"
  resources :users, only: :show
end
