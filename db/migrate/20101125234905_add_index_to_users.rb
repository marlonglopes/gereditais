class AddIndexToUsers < ActiveRecord::Migration
  def self.up
		add_index :users, :id
		add_index :users, :username
		add_index :users, :email
		add_index :users, :cnpj_cpf, :unique => true
		
 end

  def self.down
		remove_index :users, :id
		remove_index :users, :username
		remove_index :users, :email
		remove_index :users, :cnpj_cpf
  end
end
