class AddIndexToCep < ActiveRecord::Migration

	def self.up
		add_index :ceps, :cep, :unique => true
	end

	def self.down
		remove_index :ceps, :cep
	end
end
