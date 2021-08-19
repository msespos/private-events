class AddAttendingFromTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :attending, :integer
  end
end
