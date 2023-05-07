Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"

  resources :pages, only: :index do 
    collection do
      get :clients
      get :cars
      get :gas_stations
      get :fuels
      get :transactions
      get :administrators
      get :loyalty_programs
      get :user_loyalty_programs
      get :current_date_transactions
    end

  end
  resources :clients
  resources :gas_stations
  resources :fuels
  resources :administrators
  resources :loyalty_programs
  resources :cars
  resources :transactions
  resources :user_loyalty_programs
  resources :current_date_transactions
end
