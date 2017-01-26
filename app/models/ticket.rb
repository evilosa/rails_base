class Ticket < ApplicationRecord
  validates :number, :train, :user, :start_station, :end_station, presence: true

  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation'
  belongs_to :end_station, class_name: 'RailwayStation'

  after_create :send_notification

  before_destroy :send_delete_notification

  class << self
    def new_number
      current_max = maximum(:number)
      current_max ||= 0
      current_max += 1
    end
  end

  def initials
    return if last_name.nil? || first_name.nil? || second_name.nil?
    "#{last_name.capitalize} #{first_name.first}. #{second_name.first}."
  end

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_delete_notification
    TicketsMailer.delete_ticket(self.user, self).deliver_now
  end
end