class Search
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  class << self
    def find_route_trains(stations) 
      routes = Route.joins(:railway_stations, :trains).select('trains.number as train_number, routes.name as route_name, railway_stations.name as railway_station_name, railway_stations_routes.arrival_time, railway_stations_routes.departure_time').where(railway_stations_routes: {railway_station: stations}).group('route_name, railway_station_name').uniq
      routes.to_a
    end
  end

end