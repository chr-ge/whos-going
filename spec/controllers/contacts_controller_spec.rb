# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe 'GET #index' do
    let!(:contact) { create(:contact) }

    subject { get :index }

    it 'assigned @contacts is not empty' do
      subject
      expect(assigns(:contacts)).not_to be_empty
    end

    it 'assigned @contacts contains those contacts' do
      subject
      expect(assigns(:contacts)).to match_array([contact])
    end

    it 'renders view' do
      subject
      expect(response).to render_template(:index)
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end
  end
end
