# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { FFaker::CheesyLingo.title }
    date { FFaker::Time.between(Time.now, 3.years.from_now) }
    attendees { rand 0..500 }
  end
end
