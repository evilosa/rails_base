class RailwayStation < ApplicationRecord
  validates  :name, presence: true

  has_many :trains, foreign_key: :current_station_id

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  scope :ordered, ->   { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq}

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def update_time(route, arrival_time, departure_time)
    station_route = station_route(route)
    station_route.update(arrival_time: arrival_time, departure_time: departure_time) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def arrival(route)
      station_route(route).try(:arrival_time)
  end

  def departure(route)
    station_route(route).try(:departure_time)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
