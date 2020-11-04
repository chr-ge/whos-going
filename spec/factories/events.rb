# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { FFaker::CheesyLingo.title }
    date { FFaker::Time.datetime }
    attendees { rand 0..500 }
  end
end
