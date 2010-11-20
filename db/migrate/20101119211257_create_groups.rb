class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.text :info
      t.integer :admin

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
