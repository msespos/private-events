class AddAttendedEventForeignKeyToTickets < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :tickets, :events, column: :attended_event_id
  end
end
