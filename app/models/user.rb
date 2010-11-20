class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  validates_uniqueness_of :username
  validates_presence_of :username
  has_many :comments
  has_many :votes
  has_many :memberships
  has_many :invitations
  has_many :groups, :through => :memberships

  def invitableGroups( admin )
    admin_groups = admin.groups.select { |g| g.isAdmin?( admin ) }
    (admin_groups - self.groups).select { |g| !g.sentInvitation?( self ) }
  end

  def pendingGroups
    Invitation.where( :user_id => self.id, :state => 0 ).map { |inv| inv.group }
  end

  def leadedGroups
    Group.where( :admin => self.id )
  end

end
