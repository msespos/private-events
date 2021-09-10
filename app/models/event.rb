class Event < ApplicationRecord
  has_many :tickets, foreign_key: :attended_event_id
  has_many :attendees, through: :tickets, source: :user, dependent: :destroy
  belongs_to :creator, class_name: "User"
  validates :name, presence: true, uniqueness: true
  validates :date, presence: true
  validates :time, presence: true

  scope :past, -> { order("date desc").where("date < ?", Date.today) }
  scope :future, -> { order("date asc").where("date > ?", Date.today) }
  scope :today, -> { where("date = ?", Date.today) }
end