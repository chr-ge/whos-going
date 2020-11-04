class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.string :tag, null: false
      t.references :person
      t.references :contact

      t.timestamps
    end
    add_foreign_key :relationships, :contacts, column: :person_id, primary_key: :id
    add_foreign_key :relationships, :contacts, column: :contact_id, primary_key: :id
  end
end
