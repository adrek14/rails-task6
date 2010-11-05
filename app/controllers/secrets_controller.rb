class SecretsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @secrets = Secret.paginate( :per_page => 4, :page => 1 )
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

  def search
    @search = Secret.search( params[:search] )
    @secrets = @search.all
  end
end
