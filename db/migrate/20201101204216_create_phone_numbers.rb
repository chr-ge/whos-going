class CreatePhoneNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :phone_numbers do |t|
      t.string :label, default: 'Phone'
      t.string :phone_number, null: false
      t.references :contact, null: false, foreign_key: :true

      t.timestamps
    end
  end
end
