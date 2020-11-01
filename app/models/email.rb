# frozen_string_literal: true

class Email < ApplicationRecord
  belongs_to :contact, optional: true
  LABELS = %w[Email Home Work Other].freeze

  validates :email, presence: true
  validates :label, inclusion: { in: LABELS, message: 'Invalid Label' }
end
