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

  describe 'GET #show' do
    let!(:contact) { create(:contact) }

    subject { get :show, params: { id: contact.id } }

    it 'sets contact as @contact' do
      subject
      expect(assigns(:contact)).to eq contact
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

    it 'it assigns a new instance of a contact' do
      subject
      expect(assigns(:contact)).to be_a_new Contact
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
    subject { post :create, params: { contact: params } }

    context 'with valid params' do
      let!(:params) { { full_name: 'Friend', organization: 'Org', notes: 'Notes.' } }

      it 'creates a new contact' do
        expect { subject }.to change(Contact, :count).by(1)
      end

      it 'redirects to #index' do
        expect(subject).to redirect_to contacts_path
      end
    end

    context 'with invalid params' do
      let!(:params) { { full_name: '' } }

      it 're-renders #new' do
        subject
        expect(response).to render_template(:new)
      end
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    let!(:contact) { create(:contact) }
    subject { get :edit, params: { id: contact.id } }

    it 'it assigns a new instance of a contact' do
      subject
      expect(assigns(:contact)).to eq contact
    end

    it 'renders view' do
      subject
      expect(response).to render_template(:edit)
    end

    it 'returns a successful response' do
      subject
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #update' do
    let!(:contact) { create(:contact) }
    subject { put :update, params: { id: contact.id, contact: params } }

    context 'with valid params' do
      let!(:params) { { full_name: 'Best Friend', organization: 'Org', notes: 'Best Notes.' } }

      it 'updates the contact' do
        expect { subject }.to change { contact.reload.full_name }.from(contact.full_name).to('Best Friend')
      end

      it 'sends successful flash message' do
        subject
        expect(flash[:notice]).to eq('Contact updated successfully.')
      end

      it 'redirects to contact' do
        expect(subject).to redirect_to contact
      end
    end

    context 'with invalid params' do
      let!(:params) { { full_name: '' } }

      it 're-renders #edit' do
        subject
        expect(response).to render_template(:edit)
      end
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    let!(:contact) { create(:contact) }

    subject { delete :destroy, params: { id: contact.id } }

    it 'deletes a campaign successfully' do
      expect { subject }.to change(Contact, :count).by(-1)
      expect { Contact.find(contact.id) }.to raise_exception(ActiveRecord::RecordNotFound)
    end

    it 'sends successful flash message' do
      subject
      expect(flash[:notice]).to eq('Contact deleted successfully!')
    end

    it 'redirects to all campaigns' do
      subject
      expect(response).to redirect_to contacts_path
    end
  end
end
