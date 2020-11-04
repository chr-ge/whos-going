# frozen_string_literal: true

FactoryBot.define do
  factory :rsvp do
    rsvp { FFaker::Boolean.random }
    association :contact, factory: :contact
    event
  end
end
