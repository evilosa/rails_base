class Wagon < ApplicationRecord
  validates :number, :wagon_type, :train_id, :top_places, :bottom_places, presence: true

  belongs_to :train
end