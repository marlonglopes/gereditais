class CreateEditals < ActiveRecord::Migration
  def self.up
    create_table :editals do |t|
      t.integer :numero_licitacao
      t.integer :ano_licitacao
      t.integer :modalidade_id
      t.string :titulo
      t.text :descricao
      t.text :aviso
      t.date :data_publicacao
      t.date :data_abertura
      t.boolean :publicado
      t.timestamps
    end
  end

  def self.down
    drop_table :editals
  end
end
