class CreateImpugnations < ActiveRecord::Migration
  def self.up
    create_table :impugnations do |t|
      t.integer :edital_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :impugnations
  end
end
