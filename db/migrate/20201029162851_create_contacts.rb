class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :contacts do |t|
      t.string :full_name, null: false
      t.string :organization
      t.hstore :emails
      t.hstore :phone_numbers
      t.text :notes

      t.timestamps
    end
  end
end
