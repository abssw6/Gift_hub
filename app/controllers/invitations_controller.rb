class InvitationsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    # @invitation = Invitation.new(invitation_params)
    # params = invitation_params
    # @invitation.event = @event
    first_name = invitation_params[:user].split(" ").first
    last_name = invitation_params[:user].split(" ").last
    user = User.where(first_name: first_name, last_name: last_name).first
    # @invitation.user = user
    @invitation = Invitation.new(user: user, event: @event)
    if @invitation.save!
      redirect_to event_path(@event)
    else
      render 'event/show', status: :unprocessable_entity
    end
  end

  def invitation_params
    params.require(:invitation).permit(:user)
  end
end
