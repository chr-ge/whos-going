# frozen_string_literal: true

class Contact < ApplicationRecord
  include PgSearch::Model

  has_many :emails, inverse_of: :contact, dependent: :destroy
  has_many :phone_numbers, inverse_of: :contact, dependent: :destroy
  has_many :relationships, inverse_of: :contact, dependent: :destroy

  accepts_nested_attributes_for :emails, allow_destroy: true, reject_if: proc { |att| att['email'].blank? }
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true, reject_if:
    proc { |att| att['phone_number'].blank? }
  accepts_nested_attributes_for :relationships, allow_destroy: true, reject_if: proc { |att| att['tag'].blank? }

  validates :full_name, presence: true

  scope :sorted, -> { order('full_name ASC') }

  pg_search_scope :search_for,
                  associated_against: {
                    emails: %i[email],
                    phone_numbers: %i[phone_number]
                  },
                  against: %i[full_name organization notes],
                  order_within_rank: 'contacts.full_name ASC'

  def primary_email
    return unless emails.present?

    if emails.find_by(label: 'Email')
      emails.find_by(label: 'Email').email
    else
      emails.first.email
    end
  end

  def primary_phone_number
    return unless phone_numbers.present?

    if phone_numbers.find_by(label: 'Phone')
      phone_numbers.find_by(label: 'Phone').phone_number
    else
      phone_numbers.first.phone_number
    end
  end
end
