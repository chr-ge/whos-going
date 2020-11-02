# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ContactHelper. For example:
#
# describe ContactHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ContactHelper, type: :helper do
  describe 'contact_image' do
    let(:contact) { create(:contact) }

    it 'returns image tag' do
      expect(helper.contact_image(contact)).to eq("<img alt=\"#{contact.full_name}\" src=\"https://avatars.dicebear.com/api/initials/#{contact.full_name}.svg?options[bold]=1\" />")
    end
  end
end
