class AddAttendeeForeignKeyToTickets < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :tickets, :users, column: :attendee_id
  end
end
