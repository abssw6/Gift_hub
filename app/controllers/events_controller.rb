require 'date'

class EventsController < ApplicationController
  def index
    @events = Event.all

    if params[:query].present?
      @events = Event.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @events = Event.where("start_time > '#{DateTime.now()}'").sort_by { |event| event.start_time }
    end
  end

  # def calendar
  #   # start_time = params.fetch(:start_time, Date.today).to_date
  #   @events = Event.where(starts_at: start_time.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  # end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save!
# create wishlist here
      @wishlist = Wishlist.create(name: @event.title, event_id: @event.id)
      # redirect to wishlist_show_page using id from wishlist created
      # event_wishlist GET    /events/:event_id/wishlists/:id(.:format)                                                         wishlists#show
      redirect_to event_wishlist_path(event_id: @event.id, id: @wishlist.id)
    else
      render 'event/show', status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    redirect_to @event, notice: 'Event was successfully updated.' if @event.update(event_params)
  end

  def show
    @event = Event.find(params[:id])
    @wishlist = Wishlist.where(event_id: @event.id).first
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
    params.require(:event).permit(:start_time, :category, :title)
  end
end
