Rails.application.routes.draw do
  resources :trains do
    resources :wagons, shallow: true
  end

  resources :railway_stations do
    patch :update_position, :update_time, on: :member
  end

  resources :routes, :users, :tickets



  get 'search', to: 'search#index'
  get 'result', to: 'search#show'


  root 'search#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
