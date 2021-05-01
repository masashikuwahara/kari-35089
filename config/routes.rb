Rails.application.routes.draw do
  devise_for :users
  root to: "pictures#index"
  resources :pictures do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  resources :relationships, only: [:create, :destroy]
end
