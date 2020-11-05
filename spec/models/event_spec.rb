# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  subject(:event) { build(:event) }

  describe 'Validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_numericality_of(:attendees) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:rsvps) }
    it { is_expected.to have_many(:contacts).through(:rsvps) }
  end

  describe '#available' do
    context 'when attendees is equal to 0' do
      let(:event) { create(:event_with_rsvps, attendees: 0) }
      subject { event.available }
      it { is_expected.to eq 0 }
    end

    context 'when attendees is greater than 0' do
      let(:event) { create(:event_with_rsvps, attendees: 10) }
      subject { event.available }
      it { is_expected.to eq 5 }
    end
  end
end
