class GroupsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find( params[:id] )
    @members = @group.users
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new( params[:group].merge( { :admin => current_user.id } ) )
    if @group.save
      redirect_to group_path( @group )
    else
      render new_group_path
    end
  end

  def invite
    if Group.find( params[:group_id] ).invite( params[:user_id] )
      flash[:notice] = 'Invitation was sent.'
    else
      flash[:notice] = 'Invitation failed.'
    end
    redirect_to user_path( params[:user_id] )
  end

  def accept
    if Group.find( params[:group_id] ).accept( params[:user_id] )
      flash[:notice] = 'Joined the group'
    else
      flash[:notice] = 'Joining group failed.'
    end
    redirect_to user_path( current_user )
  end

  def decline
    if Group.find( params[:group_id] ).decline( params[:user_id] )
      flash[:notice] = 'Invitation declined.'
    else
      flash[:notice] = 'Declining failed.'
    end
    redirect_to user_path( current_user )
  end
end
