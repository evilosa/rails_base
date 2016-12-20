# Плацкартный вагон
class OpenPlanCarriage < Wagon
  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, presence: true

  def calculate_total_seats
    self.total_seats = self.top_seats + self.bottom_seats + self.side_top_seats + self.side_bottom_seats
  end

  def top_seats?
    true
  end

  def bottom_seats?
    true
  end

  def side_top_seats?
    true
  end

  def side_bottom_seats?
    true
  end
end