class EventsController < ApplicationController
  def index
    if params[:query].present?
      @events = Event.where(name: params[:query])
    else
      @events = Event.all
    end
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
      @event = Event.new
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
    params.require(:event).permit(:date, :category, :title)
  end
end
