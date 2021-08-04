class AddAttendedEventIdToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :attended_event_id, :bigint
  end
end
