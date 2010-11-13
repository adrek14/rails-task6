class AddVotecountToComment < ActiveRecord::Migration
  def self.up
    add_column :comments, :vote_count, :integer
  end

  def self.down
    remove_column :comments, :vote_count
  end
end
