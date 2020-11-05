# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rsvp, type: :model do
  subject(:rsvp) { build(:rsvp) }

  describe 'Validations' do
    it { is_expected.to be_valid }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:contact) }
    it { is_expected.to belong_to(:event) }
  end
end
