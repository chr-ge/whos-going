# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

FactoryBot.create_list(:event, 15)

Event.all.each do |e|
  FactoryBot.create_list(:rsvp, 5, event: e)
end

Contact.all.each do |c|
  FactoryBot.create_list(:email, 2, contact: c)
  FactoryBot.create_list(:phone_number, 2, contact: c)
end
