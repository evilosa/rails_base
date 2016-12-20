# Сидячий вагон
class CoachCarriage < Wagon
  validates :seats, presence: true

  def calculate_total_seats
    self.total_seats = self.seats
  end

  def seats?
    true
  end
end