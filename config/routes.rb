Rails.application.routes.draw do
  devise_for :users
  root to: "pictures#index"
  resources :pictures, only: [:new, :create, :show, :edit, :update, :destroy]
end
