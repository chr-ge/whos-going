# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end
end
