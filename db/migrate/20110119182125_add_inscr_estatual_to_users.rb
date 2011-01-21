class AddInscrEstatualToUsers < ActiveRecord::Migration
  def self.up
  
   	 add_column :users, :inscr_estatual, :string

  end

  def self.down
  
     	 remove_column :users, :inscr_estatual
  end
end
