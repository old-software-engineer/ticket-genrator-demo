class Ticket < ApplicationRecord
  #-----------------backend validations--------------------------
  validates_presence_of :title, :notes

  #-----------scope for finding ticket for today-----------------------
  scope :today_tickets, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }

  #--------use of callbacks-----------------------------------
  after_create do             #assigning uniq ticket number
    number = Time.now.strftime("%Y-%d-%m")+"-"+self.class.last_ticket_number  #calling class method for uniq incremented number from db
    self.update_attributes(:number => number)
  end

  #--------------class method--------------------------------
  def self.last_ticket_number    #method to find uniq ticket number for the day
    last_number = today_tickets.last&.number
    last_number ? last_number.split("-").last + 1 : "1"
  end

end
