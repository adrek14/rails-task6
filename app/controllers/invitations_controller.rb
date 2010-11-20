class InvitationsController < ApplicationController

  before_filter :authenticate_user!

  def new
    @invitation = Invitation.new( params[:id] )
    @invitation.save
    # pass a meassge that everything went fine
    render user_path( params[:id] )
  end

end
