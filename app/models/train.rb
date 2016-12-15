class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station, class_name: 'RailwayStation'
  belongs_to :route, optional: true

  has_many :tickets
  has_many :wagons

  def wagons_info
    unless wagons.empty?
      placcart = wagons.where(wagon_type: 'Плацкартный').size
      coupe = wagons.where(wagon_type: 'Купейный').size
    end
    "Плацкартных #{placcart ||= 0}/ Купейных #{coupe ||= 0}"
  end

  def wagons_places_info
    unless wagons.empty?
      result = ''
      {'В': :top_places, 'Н': :bottom_places}.each do |param_key, param_value|
        calculated_data = wagons.group(:wagon_type).sum(param_value)
        calculated_data.each do |key, value|
          result += "#{key} #{value} #{param_key}/ "
        end
      end
    end
    result ||= 'Нет данных'
  end
end