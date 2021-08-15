class Event < ApplicationRecord
  has_many :tickets, foreign_key: :attended_event_id
  has_many :attendees, through: :tickets
  belongs_to :creator, class_name: "User"

  scope :past, -> { order("date desc").where("date < ?", Date.today) }
  scope :future, -> { order("date asc").where("date > ?", Date.today) }
  scope :today, -> { where("date = ?", Date.today) }
end