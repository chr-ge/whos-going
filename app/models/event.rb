# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :rsvps, dependent: :destroy
  has_many :contacts, through: :rsvps, source: :contact

  accepts_nested_attributes_for :rsvps, allow_destroy: true, reject_if: proc { |att| att['rsvp'].blank? }

  validates :name, :date, presence: true
  validates :attendees, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate  :date_cannot_be_in_past

  def available
    attendees < rsvps.where(rsvp: true).count ? '0' : attendees - rsvps.where(rsvp: true).count
  end

  private

  def date_cannot_be_in_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
end
