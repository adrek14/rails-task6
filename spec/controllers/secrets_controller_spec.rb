require 'spec_helper'

describe SecretsController do
  include Devise::TestHelpers

  context "with an anonymous visitor" do
      before do
        # @user = mock_model( User )
        @user = Factory( :user )
        sign_in @user
        sign_out @user
      end

      it "redirects to login" do
        get :index
        #post :create, :widget => valid_widget_attributes
        response.should redirect_to( user_session_path )
        response.should_not render_template( "secrets/index" )
      end

      pending "should have a before_filter for authenticate_user!" do
        controller.class.before_filters.should include( :authenticate_user! )
      end
  end 

  context "with logged in user" do
      
      before do
        # @user = mock_model( User )
        # sign_in :user, @user
        # warden.session_serializer.store(@user,:user)
        # @user = mock_model(User, :username => "john", :email => "john@john.net", :password => "longjohn" )
        # user = User.create!(:email => "test@test.com", :password => "123456", :password_confirmation => "123456", :username => "test") 
        @user = Factory( :user )
        sign_in @user
      end

      it "redirects to index" do
        get :index
        response.should render_template( "secrets/index" )
        response.should_not redirect_to( user_session_path )
      end
      
      context "when submitting a secret" do
          before do
            @secret = Factory( :secret )
          end
          it "should allow secret creation" do
            post :create, :secret => @secret
            response.should be_success 
          end  
      end 
    
      pending "it should be super-cool" do
      end
    
  end 

end
