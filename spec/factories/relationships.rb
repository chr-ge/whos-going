# frozen_string_literal: true

FactoryBot.define do
  factory :relationship do
    tag { Relationship::TAGS.sample }

    association :person, factory: :contact
    association :contact, factory: :contact
  end
end
