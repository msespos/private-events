class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :date
      t.time :time
      t.string :location

      t.timestamps
    end
  end
end
