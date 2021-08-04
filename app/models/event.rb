class Event < ApplicationRecord
  has_many :tickets, foreign_key: :attended_event_id
  has_many :attendees, through: :tickets
  belongs_to :creator, class_name: "User"
end
