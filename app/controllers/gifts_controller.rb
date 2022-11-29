class GiftsController < ApplicationController
  def show
    @gift = Gift.find(params[:id])
  end

  def index
    @gifts = Gift.all
  end

  def commit_gift
    @gift = Gift.find(params[:id])
    @event = Event.find(params[:event_id])
    @wishlist = Wishlist.where(event_id: @event.id).first
    Usercommit.create(gift_id: @gift.id, event_id: @event.id, wishlist_id: @wishlist.id, user_id: current_user.id, is_commited: true)
    redirect_to commit_gift_gift_path(event_id: @event.id, wishlist_id: @wishlist.id, gift_id: @gift.id)
  end
end
