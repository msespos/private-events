class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.bigint :user_id
      t.bigint :event_id

      t.timestamps
    end
  end
end
