Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Home routes
  root "home#index"
  get 'about', to: 'home#about'
  get 'search', to: 'home#search', as: 'search'

  # Resource routes
  resources :cryptocurrencies, only: [:index, :show] do
    resources :cryptocurrency_exchanges, only: [:index, :show]
  end

  resources :exchanges, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :wallets, only: [:index, :show] do
    resources :wallet_cryptocurrencies, only: [:index, :show]
  end
end
