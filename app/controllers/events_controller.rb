require 'date'

class EventsController < ApplicationController
  def index
    # @events = current_user.events.where("eventdate > '#{DateTime.now()}'").sort_by { |event| event.eventdate }
    @events = Event.where("eventdate > '#{DateTime.now()}'").sort_by { |event| event.eventdate }
    if params[:query].present?
      @events = Event.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @events = Event.all
    end
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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
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

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:eventdate, :category, :title)
  end
end
