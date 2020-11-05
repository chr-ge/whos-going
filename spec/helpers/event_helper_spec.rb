# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventHelper, type: :helper do
  describe 'date_in_words' do
    let(:event) { create(:event, date: 2.months.from_now) }

    it 'returns date in words' do
      expect(helper.date_in_words(event)).to eq('starts in 2 months')
    end
  end
end
