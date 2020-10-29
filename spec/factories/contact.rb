# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    full_name { FFaker::Name.name }
    organization { FFaker::Company.name }
    emails { { ['work', 'home', 'primary'].sample => FFaker::Internet.email } }
    phone_numbers { { ['home', 'mobile', 'iPhone'].sample => FFaker::PhoneNumber.short_phone_number } }
    notes { FFaker::Lorem.paragraph }
  end
end
