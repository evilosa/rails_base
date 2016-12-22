class Wagon < ApplicationRecord
  validates :number, uniqueness: { scope: :train_id }, if: :train?
  before_validation :set_number

  belongs_to :train

  scope :ordered, -> (order) { order(number: order ? 'asc' : 'desc') }

  TYPES = %w(CoachCarriage CompartmentCarriage OpenPlanCarriage UpholsteredCarriage).freeze
  SEATS_TYPES = [].freeze

  def calculate_total_seats
    0
  end

  def has_seats?(seats_type)
    self.class::SEATS_TYPES.include?(seats_type)
  end

  def train?
    self.train.present?
  end

  private

  def set_number
    return unless train? && self.number.nil?

    self.number = train.wagons.size + 1
  end
end