Rails.application.routes.draw do
  devise_for :users

  get 'search', to: 'search#index'
  get 'result', to: 'search#show'

  root 'search#index'

  resources :tickets, only: [:index, :new, :create, :show, :destroy]

  namespace :admin do

    get 'main/index'
    root 'main#index'

    resources :trains do
      resources :wagons, shallow: true
    end

    resources :railway_stations do
      patch :update_position, :update_time, on: :member
    end

    resources :routes, :tickets
  end

end
