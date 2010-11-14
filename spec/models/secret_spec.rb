require 'spec_helper'

describe Secret do

  before(:each) do
    @secret = Secret.new( :content => "Elvis lives!" )
  end

  it "should be valid" do
    @secret.should be_valid
  end

  it "should not be valid without a content" do
    @secret.content = ''
    @secret.should_not be_valid
  end

  it "should create comments" do
    @secret = Secret.new
    user = mock_model("User", :user_id => 1 )
    secret = mock
    secret.stub!(:new_comment).and_return(true)
    Comment.create( {:content => "dummy-content", :vote_count => 0, :user_id => user.user_id} )
  end

end
