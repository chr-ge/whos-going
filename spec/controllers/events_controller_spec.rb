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

  describe 'POST #create' do
    subject { post :create, params: { event: params } }

    context 'with valid params' do
      let!(:params) { { name: 'Christmas', date: 3.months.from_now, attendees: 50 } }

      it 'creates a new contact' do
        expect { subject }.to change(Event, :count).by(1)
      end

      it 'redirects to #index' do
        expect(subject).to redirect_to events_path
      end
    end

    context 'with invalid params' do
      let!(:params) { { name: '', date: '', attendees: '50' } }

      it 're-renders #new' do
        subject
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:event) { create(:event) }

    subject { delete :destroy, params: { id: event.id } }

    it 'deletes an event successfully' do
      expect { subject }.to change(Event, :count).by(-1)
      expect { Event.find(event.id) }.to raise_exception(ActiveRecord::RecordNotFound)
    end

    it 'sends successful flash message' do
      subject
      expect(flash[:notice]).to eq('Event deleted successfully!')
    end

    it 'redirects to all campaigns' do
      subject
      expect(response).to redirect_to events_path
    end
  end
end
