class Ticket < ApplicationRecord
  validates :number, presence: true

end