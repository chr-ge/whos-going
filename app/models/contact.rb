# frozen_string_literal: true

class Contact < ApplicationRecord
  include PgSearch::Model

  has_many :emails, inverse_of: :contact, dependent: :destroy
  has_many :phone_numbers, inverse_of: :contact, dependent: :destroy
  accepts_nested_attributes_for :emails, allow_destroy: true, reject_if: proc { |att| att['email'].blank? }
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true, reject_if:
    proc { |att| att['phone_number'].blank? }

  validates :full_name, presence: true
  pg_search_scope :search_for,
                  associated_against: {
                    emails: %i[email],
                    phone_numbers: %i[phone_number]
                  },
                  against: %i[full_name organization notes],
                  order_within_rank: 'contacts.full_name ASC'
end
