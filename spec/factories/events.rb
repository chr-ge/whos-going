# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { FFaker::CheesyLingo.title }
    date { FFaker::Time.between(Time.now, 3.years.from_now) }
    attendees { rand 1..120 }

    factory :event_with_rsvps do
      transient do
        rsvp_count { 5 }
      end

      rsvps do
        Array.new(rsvp_count) { association :rsvp, rsvp: true }
      end
    end
  end
end
