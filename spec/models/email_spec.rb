# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Email, type: :model do
  subject(:email) { build(:email) }

  describe 'Validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:email) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:contact) }
  end
end
