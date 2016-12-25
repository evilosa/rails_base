class PersonalInfo < ApplicationRecord
  validates :first_name, :second_name, :last_name, presence: true

  belongs_to :ticket
end