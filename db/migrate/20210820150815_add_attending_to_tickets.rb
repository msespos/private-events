class AddAttendingToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :attending, :boolean, default: false
  end
end
