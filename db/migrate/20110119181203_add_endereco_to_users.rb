class AddEnderecoToUsers < ActiveRecord::Migration
  def self.up

  	 add_column :users, :cep, :string
    add_column :users, :logradouro, :string
    add_column :users, :numero, :integer
    add_column :users, :complemento, :string
    add_column :users, :bairro, :string
    add_column :users, :cidade, :string
    add_column :users, :uf, :string

  end

  def self.down


  	 remove_column :users, :cep
    remove_column :users, :logradouro
    remove_column :users, :numero
    remove_column :users, :complemento
    remove_column :users, :bairro
    remove_column :users, :cidade
    remove_column :users, :uf


  end
end
