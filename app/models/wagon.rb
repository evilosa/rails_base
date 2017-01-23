class Wagon < ApplicationRecord
  validates :number, uniqueness: { scope: :train_id }, if: :train?
  before_validation :set_number

  belongs_to :train

  scope :ordered, -> (order) { order(number: order ? 'asc' : 'desc') }

  TYPES = %w(CoachCarriage CompartmentCarriage OpenPlanCarriage UpholsteredCarriage).freeze
  SEATS_TYPES = [].freeze

  def has_seats?(seats_type)
    self.class::SEATS_TYPES.include?(seats_type)
  end

  def train?
    self.train.present?
  end

  def self.inherited(base)
    super
    def base.model_name
      superclass.model_name
    end
  end

  private

  def set_number
    return unless train? && self.number.nil?

    self.number = train.wagons.size
  end
end