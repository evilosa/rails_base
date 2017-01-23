# Сидячий вагон
class CoachCarriage < Wagon
  validates :seats, presence: true

  SEATS_TYPES = [:seats].freeze

end