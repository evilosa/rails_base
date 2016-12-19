class Wagon < ApplicationRecord
  validates :number, :train_id, presence: true

  belongs_to :train

  def total_seats
    0
  end
end