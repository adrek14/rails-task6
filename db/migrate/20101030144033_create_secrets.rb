class CreateSecrets < ActiveRecord::Migration
  def self.up
    create_table :secrets do |t|
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :secrets
  end
end
