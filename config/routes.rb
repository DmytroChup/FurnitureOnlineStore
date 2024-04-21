Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :producers
  devise_for :users
  resources :orders
  resources :producers do
    resources :private_chats, only: [:index, :show] do
      resources :messages, only: [:create]
    end
  end
  resources :subcategories
  resources :categories
  resources :products
  resources :carts
  resources :users do
    get 'create_chat_index', on: :member
    post 'create_chat', on: :member
    resources :private_chats, only: [:index, :show] do
      resources :messages, only: [:create]
    end
  end
  resources :payment_histories
  resources :order_items

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"
end
