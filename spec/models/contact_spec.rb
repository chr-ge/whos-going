# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject(:contact) { build(:contact) }

  describe 'Validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:full_name) }
    it { puts contact.emails }
  end
end
