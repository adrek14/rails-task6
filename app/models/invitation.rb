class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  def reject
    self.state = -1
    self.save
  end

  def accecpt
    self.state = 1  if self.state == 0
  end

end
