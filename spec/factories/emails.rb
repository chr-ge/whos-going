# frozen_string_literal: true

FactoryBot.define do
  factory :email do
    label { Email::LABELS.sample }
    email { FFaker::Internet.email }
    contact
  end
end
