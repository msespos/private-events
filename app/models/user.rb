class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable,
         :authentication_keys => [:name]
  has_many :tickets, foreign_key: :attendee_id
  has_many :attended_events, through: :tickets, source: :event, dependent: :destroy
  has_many :created_events, foreign_key: :creator_id, class_name: "Event"

  def ticket_for(event)
    tickets.where('attended_event_id = ?', event.id).first
  end
end
