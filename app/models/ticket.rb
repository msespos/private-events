class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event, foreign_key: :attended_event_id
end
