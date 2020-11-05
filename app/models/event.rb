# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :rsvps, dependent: :destroy
  has_many :contacts, through: :rsvps, source: :contact

  accepts_nested_attributes_for :rsvps, allow_destroy: true, reject_if: :all_blank

  validates :name, :date, presence: true
  validates :attendees, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate  :date_cannot_be_in_past

  def available
    count = rsvps.where(rsvp: true).count
    attendees < count ? 0 : attendees - count
  end

  private

  def date_cannot_be_in_past
    errors.add(:date, "can't be in the past") if date.present? && date < Date.today
  end
end
