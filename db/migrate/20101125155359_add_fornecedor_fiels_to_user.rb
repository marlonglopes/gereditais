class AddFornecedorFielsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :cnpj_cpf, :string
    add_column :users, :razao_social, :string
    add_column :users, :fone, :string
    add_column :users, :fax, :string
    add_column :users, :contato, :string

  end

  def self.down
    remove_column :users, :cnpj_cpf
    remove_column :users, :razao_social
    remove_column :users, :fone
	 remove_column :users, :fax
    remove_column :users, :contato
  end
end
