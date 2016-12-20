class Wagon < ApplicationRecord
  validates :number, uniqueness: { scope: :train_id }, if: :train?
  before_validation :set_number

  belongs_to :train

  scope :ordered, -> { order(:number) }
  scope :ordered_desc, -> { order('"number" desc') }
  scope :coach_carriages, -> { where(type: 'CoachCarriage') }
  scope :compartment_carriages, -> { where(type: 'CompartmentCarriage') }
  scope :open_plan_carriages, -> { where(type: 'OpenPlanCarriage') }
  scope :upholstered_carriages, -> { where(type: 'UpholsteredCarriage') }

  class << self
    def types
      %w(CoachCarriage CompartmentCarriage OpenPlanCarriage UpholsteredCarriage)
    end

    def seat_types
      %w(top_seats bottom_seats side_top_seats side_bottom_seats seats)
    end
  end

  def calculate_total_seats
    0
  end

  def train?
    self.train.present?
  end

  def top_seats?
    false
  end

  def bottom_seats?
    false
  end

  def side_top_seats?
    false
  end

  def side_bottom_seats?
    false
  end

  def seats?
    false
  end

  private

  def set_number
    return unless train.present? && self.number.nil?

    self.number = train.wagons.maximum(:number) + 1 if train.wagons.size > 0
  end
end