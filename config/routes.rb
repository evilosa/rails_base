Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  resources :routes
  resources :wagons
  resources :coach_carriages, controller: 'wagons', type: 'CoachCarriage'
  resources :compartment_carriages, controller: 'wagons', type: 'CompartmentCarriage'
  resources :open_plan_carriages, controller: 'wagons', type: 'OpenPlanCarriage'
  resources :upholstered_carriages, controller: 'wagons', type: 'UpholsteredCarriage'

  root 'railway_stations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
