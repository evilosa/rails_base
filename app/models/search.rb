class Search
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  class << self
    def find_route_trains(search)
      start_routes = Route.joins(:railway_stations, :trains).select('trains.id as train_id, trains.number as train_number, routes.id as route_id, routes.name as route_name, railway_stations.id as start_station_id, railway_stations_routes.arrival_time').where(railway_stations_routes: {railway_station: search[:first_station_id] }).uniq
      # start_temp = start_routes.to_a
      end_routes = Route.joins(:railway_stations, :trains).select('trains.id as train_id, trains.number as train_number, routes.id as route_id, routes.name as route_name, railway_stations.id as end_station_id, railway_stations_routes.departure_time').where(railway_stations_routes: {railway_station: search[:last_station_id] }).uniq
      # end_temp = end_routes.to_a
      start_routes.merge(end_routes)
      #total = start_routes.merge(end_routes)
      # result_routes = total.to_a
      #nil if total == 0
    end
  end

end