Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "cryptocurrencies#index"

  #resource roots
  resources :cryptocurrencies, only: [:index, :show]
  resources :exchanges, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :wallets, only: [:index, :show]

  # Nested routes for hierarchical navigation
  resources :wallets do
    resources :wallet_cryptocurrencies, only: [:index, :show]
  end

  resources :cryptocurrencies do
    resources :cryptocurrency_exchanges, only: [:index, :show]
  end

  # About page
  get 'about', to: 'pages#about'

end
