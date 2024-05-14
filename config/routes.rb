Rails.application.routes.draw do
  resources :orders
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :producers
    devise_for :users
    
    resources :producers do
      resources :private_chats, only: [:index, :show] do
        resources :messages, only: [:create]
      end
    end
    
    resources :users do
      get 'find_people', on: :member
      get 'create_chat_index', on: :member
      post 'create_chat', on: :member
      resources :private_chats, only: [:index, :show] do
        resources :messages, only: [:create]
      end
    end

    resources :subcategories
    resources :categories
    resources :products do
      collection do
        get "export_to_csv"
      end
    end
    resources :carts
    resources :payment_histories
    resources :order_items
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get "up" => "rails/health#show", as: :rails_health_check
    get 'orders/list', to: 'orders#list', as: :orders_list
    get 'orders/prodlist', to: 'orders#prodlist', as: :orders_prodlist

    # Defines the root path route ("/")
    # root "posts#index"
    root "home#index"
  end
end
