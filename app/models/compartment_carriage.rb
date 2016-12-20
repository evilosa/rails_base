# Купейный вагон
class CompartmentCarriage < Wagon
  validates :top_seats, :bottom_seats, presence: true

  def calculate_total_seats
    self.total_seats = self.top_seats + self.bottom_seats
  end

  def top_seats?
    true
  end

  def bottom_seats?
    true
  end
end