# Плацкартный вагон
class OpenPlanCarriage < Wagon
  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, presence: true

  SEATS_TYPES = [:top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats].freeze

  def calculate_total_seats
    self.total_seats = self.top_seats + self.bottom_seats + self.side_top_seats + self.side_bottom_seats
  end
end