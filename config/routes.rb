Rails.application.routes.draw do
  devise_for :users

  resources :tickets

  namespace :admin do
    resources :trains do
      resources :wagons, shallow: true
    end

    resources :railway_stations do
      patch :update_position, :update_time, on: :member
    end

    resources :routes, :users, :tickets
  end

  get 'search', to: 'search#index'
  get 'result', to: 'search#show'

  root 'search#index'

end
