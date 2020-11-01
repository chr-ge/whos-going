# frozen_string_literal: true

class PhoneNumber < ApplicationRecord
  belongs_to :contact
  LABELS = %w[Phone Home Work Other Mobile Main Fax Pager].freeze

  validates :phone_number, presence: true
  validates :label, inclusion: { in: LABELS, message: 'Invalid Label' }
end
