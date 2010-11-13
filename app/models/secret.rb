class Secret < ActiveRecord::Base
  validates_presence_of :content
  has_many :comments, :order => "vote_count DESC" 

end
