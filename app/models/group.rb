class Group < ActiveRecord::Base
  has_many :users, :through => :memberships
  has_many :memberships
  has_many :invitations

  after_save :ensureAdminIsAUser
 
  def isAdmin?( user )
    user.id == self.admin
  end

  def invite( user )
    if Invitation.where( :user_id => user, :group_id => self.id ) == []
        @inv = Invitation.new( :user_id => user, :group_id => self.id, :state => 0 )
        @inv.save
    else
        false
    end   
  end

  def sentInvitation?( user )
    Invitation.where( :user_id => user, :group_id => self.id ) != []
  end

  def awaitingConfirmation?( user )
    Invitation.where( :user_id => user, :group_id => self.id, :state => 0 ) != []
  end

  def accept( user_id )
    if Invitation.where( :user_id => user_id, :group_id => self.id, :state => 0 ) != []
        @a = Invitation.where( :user_id => user_id, :group_id => self.id, :state => 0 )[0]
        @a.state = 1
        @a.save
        @member = Membership.new( :user_id => user_id, :group_id => self.id, :active => true )
        @member.save
    else
        false
    end
  end

  def decline
  end

  def members
      self.invitations.map { |inv| User.find( inv.user_id ) }
  end

  def ensureAdminIsAUser
    if !self.users.include?( self.admin )
      @membership = Membership.new( :user_id => self.admin, :group_id => self.id, :active => true )
      @membership.save
    end
  end

end 
