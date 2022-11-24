require 'date'

class EventsController < ApplicationController
  def index
    # @events = current_user.events.where("event_date > '#{DateTime.now()}'").sort_by { |event| event.event_date }
    @events = Event.where("event_date > '#{DateTime.now()}'").sort_by { |event| event.event_date }
    # (event_date > DateTime.now())
    # @events.each do |event|
  end

  def calendar
    # event_date = params.fetch(:event_date, Date.today).to_date
    @events = Event.where(starts_at: event_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
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
    params.require(:event).permit(:event_date, :category, :title)
  end
end
