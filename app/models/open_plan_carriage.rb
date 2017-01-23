# Плацкартный вагон
class OpenPlanCarriage < Wagon
  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, presence: true

  SEATS_TYPES = [:top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats].freeze
end