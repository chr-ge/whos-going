# frozen_string_literal: true

class Relationship < ApplicationRecord
  belongs_to :person, class_name: 'Contact'
  belongs_to :contact, class_name: 'Contact'

  TAGS = %w[Spouse Child Mother Father Parent Brother Sister Friend Relative Manager Partner].freeze

  validates :person, presence: true
  validates :tag, inclusion: { in: TAGS, message: 'Invalid Tag' }
end
