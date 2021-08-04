class AddAttendeeIdToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :attendee_id, :bigint
  end
end
