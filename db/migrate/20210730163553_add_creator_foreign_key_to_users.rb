class AddCreatorForeignKeyToUsers < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :users, :events, column: :creator_id
  end
end
