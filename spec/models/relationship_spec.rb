# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Relationship, type: :model do
  subject(:relationship) { build(:relationship) }

  describe 'Validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:person) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:contact) }
  end
end
