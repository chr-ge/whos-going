class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.string :label, default: 'Email'
      t.string :email, null: false
      t.references :contact, null: false, foreign_key: :true
      
      t.timestamps
    end
  end
end
