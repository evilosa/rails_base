# Спальный мягкий вагон
class UpholsteredCarriage < Wagon
  validates :bottom_seats, presence: true

  SEATS_TYPES = [:bottom_seats].freeze
end