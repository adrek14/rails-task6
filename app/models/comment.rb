class Comment < ActiveRecord::Base
  belongs_to :secret
  belongs_to :user
  has_many :votes

  def vote( user, up )
    if up
      self.vote_count += 1
    else
      self.vote_count -= 1
    end
    self.save
  end

end
