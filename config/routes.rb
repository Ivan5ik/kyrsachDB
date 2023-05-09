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
  resources :requests, only: :index do
    collection do
      get :get_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :beetwen_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :in_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :like_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :twiceAnd_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :twiceOr_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :distinct_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :minMax_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :sumAvg_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :count_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :aggregatFuncFewField_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :aggregatFuncWhere_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :aggregatFuncWithAggregate_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :aggregateFuncSort_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :innerJoin_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :leftJoin_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :rightJoin_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :innerJoinCondition_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :innerJoinLike_request
    end
  end
  
  resources :requests, only: :index do
    collection do
      get :normalSubQuery_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :exist_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :any_request
    end
  end
  resources :requests, only: :index do
    collection do
      get :inSubQuery_request
    end
  end
end
