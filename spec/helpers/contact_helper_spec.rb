# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContactHelper, type: :helper do
  describe 'contact_image' do
    let(:contact) { create(:contact) }

    it 'returns image tag' do
      base_uri = 'https://avatars.dicebear.com/api/initials'
      expect(helper.contact_image(contact)).to eq(
        "<img alt=\"#{contact.full_name}\" src=\"#{base_uri}/#{contact.full_name}.svg?options[bold]=1\" />"
      )
    end
  end
end
