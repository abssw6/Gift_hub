class InvitationsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @invitation = Invitation.new(invitation_params)
    @invitation.event = @event
    @invitation.user = current_user
    if @invitation.save!
      redirect_to event_path(@event)
    else
      render 'event/show', status: :unprocessable_entity
    end
  end

  def invitation_params
    params.require(:invitation).permit(:user_id, :event_id, :status)
  end
end
