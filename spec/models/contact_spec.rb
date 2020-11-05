# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject(:contact) { build(:contact) }

  describe 'Validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:full_name) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:emails) }
    it { is_expected.to have_many(:phone_numbers) }
    it { is_expected.to have_many(:relationships) }
  end
end
