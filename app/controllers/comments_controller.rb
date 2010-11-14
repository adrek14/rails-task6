class CommentsController < ApplicationController

  before_filter :authenticate_user!

  def new
    @comment = Comment.new
  end

  def index
  end

  def create
    @secret = Secret.find( params[:secret_id] )
    if @secret.new_comment( params[:comment].merge( :user_id => current_user.id, :vote_count => 0) )
       redirect_to secrets_path
    else
       render new_comment_path
    end
  end
    
  def voteUp
    @comment = Comment.find( params[:comment_id] )
    @comment.vote( current_user, up=true )
    redirect_to secrets_path
  end

  def voteDown
    @comment = Comment.find( params[:comment_id] )
    @comment.vote( current_user, up=false )
    redirect_to secrets_path
  end


end
