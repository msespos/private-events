class AddCreatorIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :creator_id, :bigint
  end
end
