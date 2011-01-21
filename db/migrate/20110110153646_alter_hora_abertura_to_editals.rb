class AlterHoraAberturaToEditals < ActiveRecord::Migration
  def self.up
  	change_column :editals, :data_abertura , :timestamp
  end

  def self.down
  end
end
