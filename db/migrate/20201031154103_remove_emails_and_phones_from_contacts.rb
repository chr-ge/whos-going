class RemoveEmailsAndPhonesFromContacts < ActiveRecord::Migration[6.0]
  def change
    remove_column :contacts, :emails
    remove_column :contacts, :phone_numbers
  end
end
