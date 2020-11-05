# frozen_string_literal: true

FactoryBot.define do
  factory :rsvp do
    rsvp { FFaker::Boolean.random }
    contact
    event
  end
end
