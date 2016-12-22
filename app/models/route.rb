class Route < ApplicationRecord
  validates :name, presence: true
  validate :stations_count

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  has_many :trains

  before_validation :set_name

  private

  def set_name
    return unless name.empty? && railway_stations.size >= 2
    self.name = "#{railway_stations.first.name} - #{railway_stations.last.name}"
  end

  def stations_count
    errors.add(:base, 'Route should contain at least 2 stations') if railway_stations.size < 2
  end
end