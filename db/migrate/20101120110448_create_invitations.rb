class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.integer :group_id
      t.integer :user_id
      t.integer :state

      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
