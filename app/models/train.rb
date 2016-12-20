class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station, class_name: 'RailwayStation'
  belongs_to :route, optional: true

  has_many :tickets
  has_many :wagons

  def calculate_seats(wagon_type = 'Wagon', seats_type = 'top_seats')
    raise 'Неверно указан тип вагона' unless Wagon.types.include?(wagon_type)
    raise 'Неверно указан тип сидений' unless Wagon.seat_types.include?(seats_type)

    wagons.where(:type == wagon_type).sum(seats_type)
  end
end