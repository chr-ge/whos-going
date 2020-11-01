# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  subject(:phone_number) { build(:phone_number) }

  describe 'Validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:phone_number) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:contact) }
  end
end
