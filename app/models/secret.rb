class Secret < ActiveRecord::Base
  validates_presence_of :content
  has_many :comments, :order => "vote_count DESC" 

  def new_comment( params )
    @comment = self.comments.new( params )
    @comment.save # will return true/false
  end

end
