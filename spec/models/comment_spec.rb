require 'spec_helper'

describe Comment do

  it "should allow voting up" do
    comment = Comment.new( :vote_count => 0 )
    user = mock
    comment.vote( user, up=true )
    comment.vote_count.should be == 1
  end

  it "should allow voting down" do
    comment = Comment.new( :vote_count => 0 )
    user = mock
    comment.vote( user, up=false )
    comment.vote_count.should be == -1
  end
end
