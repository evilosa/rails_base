# Купейный вагон
class CompartmentCarriage < Wagon
  validates :top_seats, :bottom_seats, presence: true

  SEATS_TYPES = [:top_seats, :bottom_seats].freeze

end