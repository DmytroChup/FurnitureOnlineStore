Rails.application.routes.draw do
  resources :orders
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :producers
    devise_for :users

    resources :producers
    resources :subcategories
    resources :categories
    resources :products do
      collection do
        get "export_to_csv"
      end
    end
    resources :carts
    resources :users
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
end
