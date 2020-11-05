class CreateRsvps < ActiveRecord::Migration[6.0]
  def change
    create_table :rsvps do |t|
      t.boolean :rsvp, null: false
      t.references :contact, null: false, foreign_key: :true
      t.references :event, null: false, foreign_key: :true

      t.timestamps
    end
  end
end
