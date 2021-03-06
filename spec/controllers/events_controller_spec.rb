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

  describe 'GET #show' do
    let!(:event) { create(:event) }

    subject { get :show, params: { id: event.id } }

    it 'sets event as @event' do
      subject
      expect(assigns(:event)).to eq event
    end

    it 'renders view' do
      subject
      expect(response).to render_template(:show)
    end

    it 'returns http success' do
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

  describe 'PUT #update' do
    let!(:event) { create(:event) }
    subject { put :update, params: { id: event.id, event: params } }

    context 'with valid params' do
      let!(:params) { { name: 'Halloween', date: 1.years.from_now, attendees: 75 } }

      it 'updates the contact' do
        subject
        expect(event.reload.name).to eq('Halloween')
        expect(event.reload.date).to be_within(1.second).of 1.years.from_now
        expect(event.reload.attendees).to eq(75)
      end

      it 'sends successful flash message' do
        subject
        expect(flash[:notice]).to eq('Event updated successfully.')
      end

      it 'redirects to event' do
        expect(subject).to redirect_to event
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
