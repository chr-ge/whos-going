class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.datetime :date
      t.integer :attendees, default: 0

      t.timestamps
    end
  end
end
