Rails.application.routes.draw do
  resources :trains do
    resources :wagons, :coach_carriages, :compartment_carriages, :open_plan_carriages, :upholstered_carriages, shallow: true
  end

  resources :railway_stations do
    patch :update_position, on: :member
  end
  resources :routes

  root 'railway_stations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
