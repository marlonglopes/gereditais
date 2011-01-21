class AlterDataAberturaToEditals < ActiveRecord::Migration
  def self.up

#	execute <<-SQL
#		ALTER TABLE editals ALTER data_abertura TYPE timestamp with time zone;
#	SQL

  end

  def self.down
  end
end
