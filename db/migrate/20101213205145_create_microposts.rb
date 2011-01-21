class CreateMicroposts < ActiveRecord::Migration
  def self.up
    create_table :microposts do |t|
      t.text    :post
	   t.integer :edital_id
  	   t.integer :user_id

      t.timestamps

    end
  end

  def self.down
    drop_table :microposts
  end
end
