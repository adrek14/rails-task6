require 'spec_helper'

describe CommentsController do

  include Devise::TestHelpers

 context "with logged in user" do
      
      before do
        @user = Factory( :user )
        sign_in @user
        Comment.stub!(:new).and_return(@comment = mock_model(Comment, :save=>true))
      end

      it "creates comments" do
        @secret = Factory( :secret )
        Comment.should_receive(:new).with( {"user_id" => @user.id, "content" => "dummy", "vote_count" => 0} ).and_return(@comment)
        post :create, :comment => {:content => "dummy"}, :secret_id => @secret.id 
      end
   
      # No route matches ... error 
      pending "votes up" do
        @comment = mock_model( Comment, {:id => 1, :content => "dummy", :vote_count => 0 } )
        @comment.should_receive(:voteUp).and_return(true)
        get :voteUp
      end
 
  end
end
=begin 
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
=end
