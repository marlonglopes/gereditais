class AddIndexToDownloads < ActiveRecord::Migration
  def self.up
		add_index :downloads, :edital_id
		add_index :downloads, :user_id
  end

  def self.down
		remove_index :downloads, :edital_id
		remove_index :downloads, :user_id
  end
end
