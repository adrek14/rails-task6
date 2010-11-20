class UsersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find( params[:id] )
    @invitable = User.find( params[:id] ).invitableGroups( current_user )
    @pending = User.find( params[:id] ).pendingGroups
    @leaded = User.find( params[:id] ).leadedGroups
  end

end
