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

  describe '#primary_email' do
    context 'when contact has no emails' do
      let(:contact) { create(:contact) }
      subject { contact.primary_email }
      it { is_expected.to eq nil }
    end

    context 'when contact has an email with Email label' do
      let(:home_email) { create(:email, email: 'home@example.com', label: 'Home') }
      let(:email) { create(:email, email: 'test@example.com', label: 'Email', contact: home_email.contact) }
      subject { email.contact.primary_email }
      it { is_expected.to eq 'test@example.com' }
    end

    context 'when contact has no email with label Email' do
      let(:email) { create(:email, email: 'home@example.com', label: 'Home') }
      subject { email.contact.primary_email }
      it { is_expected.to eq 'home@example.com' }
    end
  end

  describe '#primary_phone_number' do
    context 'when contact has no phone numbers' do
      let(:contact) { create(:contact) }
      subject { contact.primary_phone_number }
      it { is_expected.to eq nil }
    end

    context 'when contact has an email with Phone label' do
      let(:home_number) { create(:phone_number, phone_number: '222 222-2222', label: 'Home') }
      let(:number) { create(:phone_number, phone_number: '111 111-1111', label: 'Phone', contact: home_number.contact) }
      subject { number.contact.primary_phone_number }
      it { is_expected.to eq '111 111-1111' }
    end

    context 'when contact has no email with label Phone' do
      let(:home_number) { create(:phone_number, phone_number: '222 222-2222', label: 'Home') }
      subject { home_number.contact.primary_phone_number }
      it { is_expected.to eq '222 222-2222' }
    end
  end
end
