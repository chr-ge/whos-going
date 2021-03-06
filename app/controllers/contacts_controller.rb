# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]

  def index
    if params[:search]&.present?
      @contacts = Contact.search_for(params[:search])
      render :search
    else
      @contacts = Contact.sorted
    end
  end

  def show; end

  def new
    @contact = Contact.new
    @contact.emails.build
    @contact.phone_numbers.build
    @contact.relationships.build
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to contacts_path, notice: 'Contact created successfully!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contact updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path, notice: 'Contact deleted successfully!'
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact)
          .permit(:full_name, :organization, :notes, emails_attributes: %i[id label email _destroy],
                                                     phone_numbers_attributes: %i[id label phone_number _destroy],
                                                     relationships_attributes: %i[id tag person_id _destroy])
  end
end
