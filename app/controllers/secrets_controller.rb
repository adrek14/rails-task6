class SecretsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @secrets = Secret.all
  end

  def new
    @secret = Secret.new
  end

  def create
    secret = Secret.create(params[:secret])
    redirect_to secrets_path
  end

  def destroy
    @secret = Secret.find( params[:id] )
    Secret.delete( @secret )
    redirect_to secrets_path
  end
end
