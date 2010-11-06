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

end
