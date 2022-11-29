class UsercommitsController < ApplicationController
  def new
    @usercommit = Usercommit.new
  end

  def create
    @usercommit = Usercommit.new(usercommit_params)
    @usercommit.user = current_user
    if @usercommit.save!
      Usercommit.create(user_id: current_user.id, wishlist_id: @wishlist.id,
                        event_id: @event.id, gift_id: params[:gift_id])
      redirect_to
    else
      render 'gift/show', status: :unprocessable_entity
    end
  end

  private

  def usercommit_params
    params.require(:usercommit).permit(:user_id, :event_id, :wishlist_id, :gift_id)
  end
end

# check create method is updated
# in wishlist show page for simple form - reference wishlist and usercommit
# Usercommit.create(user_id: current_user.id, wishlist_id: @wishlist.id, event_id: @event.id, gift_id: params[:gift_id])
