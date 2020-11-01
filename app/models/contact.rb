# frozen_string_literal: true

class Contact < ApplicationRecord
  has_many :emails, inverse_of: :contact, dependent: :destroy
  accepts_nested_attributes_for :emails, reject_if: :all_blank, allow_destroy: true

  validates :full_name, presence: true
end
