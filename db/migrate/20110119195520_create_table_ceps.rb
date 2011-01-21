class CreateTableCeps < ActiveRecord::Migration
   def self.up
    create_table :ceps do |t|
      t.string :cep
      t.string :logradouro
  	 	t.string :bairro
  	 	t.string :localidade
  	 	t.string :uf

      t.timestamps
    end
  end

  def self.down
    drop_table :ceps
  end
end
