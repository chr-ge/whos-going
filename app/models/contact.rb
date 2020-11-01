# frozen_string_literal: true

class Contact < ApplicationRecord
  has_many :emails, inverse_of: :contact, dependent: :destroy
  has_many :phone_numbers, inverse_of: :contact, dependent: :destroy
  accepts_nested_attributes_for :emails, allow_destroy: true, reject_if: proc { |att| att['email'].blank? }
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true, reject_if: proc { |att| att['phone_number'].blank? }

  validates :full_name, presence: true
end
