# frozen_string_literal: true

class Rsvp < ApplicationRecord
  belongs_to :contact
  belongs_to :event
  validates :rsvp, inclusion: { in: [true, false] }
end
