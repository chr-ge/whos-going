# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to events_path, notice: 'Event created successfully!'
    else
      render :new
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'Event deleted successfully!'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :date, :attendees)
  end
end
