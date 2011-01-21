class AddIndexToEditals < ActiveRecord::Migration
  def self.up

		add_index :editals, :id
		add_index :editals, :descricao

  end

  def self.down
		remove_index :editals, :id
		remove_index :editals, :descricao

  end
end
