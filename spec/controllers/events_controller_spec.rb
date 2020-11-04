# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #index' do
    let!(:event) { create(:event) }

    subject { get :index }

    it 'assigned @events contains those events' do
      subject
      expect(assigns(:events)).to match_array([event])
    end

    it 'renders index view' do
      subject
      expect(response).to render_template(:index)
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    subject { get :new }

    it 'it assigns a new instance of an event' do
      subject
      expect(assigns(:event)).to be_a_new Event
    end

    it 'renders view' do
      subject
      expect(response).to render_template(:new)
    end

    it 'returns a successful response' do
      subject
      expect(response).to have_http_status(:success)
    end
  end
end
