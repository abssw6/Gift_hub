require 'date'

class EventsController < ApplicationController
  def index
    # @events = current_user.events.where("eventdate > '#{DateTime.now()}'").sort_by { |event| event.eventdate }
    @events = Event.where("eventdate > '#{DateTime.now()}'").sort_by { |event| event.eventdate }
    # (eventdate > DateTime.now())
    # @events.each do |event|
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save!
      redirect_to events_path(@event)
    else
      render 'event/show', status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:eventdate, :category, :title)
  end
end
