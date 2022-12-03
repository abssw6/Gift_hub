class UsercommitsController < ApplicationController
  def new
    @usercommit = Usercommit.new
  end

  def create
    @usercommit = Usercommit.new(usercommit_params)
    @wishlist = Wishlist.find(params[:wishlist_id])
    @event = @wishlist.event
    @usercommit.user = current_user
    @usercommit.event = @event
    @usercommit.wishlist = @wishlist
    @wishlist = Wishlist.where(event_id: @event.id).first

    if @usercommit.save!
      redirect_to request.referrer, notice: "Gift Committed!"
    else
      render 'gift/show', status: :unprocessable_entity
    end
  end

  def destroy
    @usercommit = Usercommit.find(params[:id])
    @usercommit.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to wishlist_path(wishlist_id: @usercommit.wishlist), status: :see_other
  end

  private

  def usercommit_params
    params.require(:usercommit).permit(:user_id, :event_id, :wishlist_id, :gift_id, :is_commited)
  end
end

# check create method is updated
# in wishlist show page for simple form - reference wishlist and usercommit
# Usercommit.create(user_id: current_user.id, wishlist_id: @wishlist.id, event_id: @event.id, gift_id: params[:gift_id])
