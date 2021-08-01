class AddCreatorForeignKeyToEvents < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :events, :users, column: :creator_id
  end
end
