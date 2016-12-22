# Спальный мягкий вагон
class UpholsteredCarriage < Wagon
  validates :bottom_seats, presence: true

  SEATS_TYPES = [:bottom_seats].freeze

  def calculate_total_seats
    self.total_seats = self.bottom_seats
  end
end