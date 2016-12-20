# Спальный мягкий вагон
class UpholsteredCarriage < Wagon
  validates :bottom_seats, presence: true

  def calculate_total_seats
    self.total_seats = self.bottom_seats
  end

  def bottom_seats?
    true
  end
end