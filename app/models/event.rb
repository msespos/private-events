class Event < ApplicationRecord
  has_many :tickets, foreign_key: :event_id
  has_many :attendees, through: :tickets, source: :user
  belongs_to :creator, class_name: "User"
  scope :past, -> { where('date < ?', DateTime.now) }
  scope :upcoming, -> { where('date > ?', DateTime.now) }
end
