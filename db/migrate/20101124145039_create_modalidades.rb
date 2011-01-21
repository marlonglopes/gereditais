class CreateModalidades < ActiveRecord::Migration
  def self.up
    create_table :modalidades do |t|
      t.integer :codigo
      t.string :descricao
      t.timestamps
    end
  end

  def self.down
    drop_table :modalidades
  end
end
