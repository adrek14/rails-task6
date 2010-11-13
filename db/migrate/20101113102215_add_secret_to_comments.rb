class AddSecretToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :secret_id, :integer
  end

  def self.down
    remove_column :comments, :secret_id
  end
end
