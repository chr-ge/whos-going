# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    full_name { FFaker::Name.name }
    organization { FFaker::Company.name }
    notes { FFaker::Lorem.paragraph }
  end
end
