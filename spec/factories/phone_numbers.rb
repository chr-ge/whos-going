# frozen_string_literal: true

FactoryBot.define do
  factory :phone_number do
    label { PhoneNumber::LABELS.sample }
    phone_number { FFaker::PhoneNumber.short_phone_number }
    contact
  end
end
