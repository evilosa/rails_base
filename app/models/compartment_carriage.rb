# Купейный вагон
class CompartmentCarriage < Wagon
  validates :top_seats, :bottom_seats, presence: true

  SEATS_TYPES = [:top_seats, :bottom_seats].freeze

  def calculate_total_seats
    self.total_seats = self.top_seats + self.bottom_seats
  end

end