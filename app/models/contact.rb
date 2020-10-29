# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :full_name, presence: true
end
