class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def index
  end

  def create
    @secret = Secret.find( params[:secret_id] )
    @comment = @secret.comments.new( params[:comment].merge( :user_id => current_user, :vote_count => 0 ) )
    if @comment.save
      redirect_to secrets_path
    else
      render new_comment_path #:action => "new"
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
